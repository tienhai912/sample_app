class SessionsController < ApplicationController
  def create
    params_session = params[:session]
    user = User.find_by email: params_session[:email].downcase
    if user && user.authenticate(params_session[:password])
      log_in user
      redirect_to user
    else
      wrong_user
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  private
  def wrong_user
    flash.now[:danger] = t "invalid_email_pass"
    render :new
  end
end
