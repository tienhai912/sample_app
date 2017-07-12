class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by email: params[:email]
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      edit_allow user
    else
      flash[:danger] = t "invalid_activation_link"
      redirect_to root_url
    end
  end

  def edit_allow user
    user.activate
    log_in user
    flash[:success] = t "account_activated"
    redirect_to user
  end
end
