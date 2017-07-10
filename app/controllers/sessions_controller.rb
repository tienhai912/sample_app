class SessionsController < ApplicationController
  def create
    params_session = params[:session]
    user = User.find_by email: params_session[:email].downcase
    if user && user.authenticate(params_session[:password])
      right_user user
    else
      wrong_user
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private
  def wrong_user
    flash.now[:danger] = t "invalid_email_pass"
    render :new
  end

  def right_user user
    log_in user
    params[:session][:remember_me] == "1" ? remember(user) : forget(user)
    redirect_back_or user
  end
end
