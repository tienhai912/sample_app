module SessionsHelper
  def log_in user
    session[:user_id] = user.id
  end

  def remember user
    @temp_user = user
    @temp_user.remember
    cookies_permanent = cookies.permanent
    cookies_permanent.signed[:user_id] = @temp_user.id
    cookies_permanent[:remember_token] = @temp_user.remember_token
  end

  def current_user
    session_id = session[:user_id]
    cookies_signed_id = cookies.signed[:user_id]
    if session_id
      @current_user ||= User.find_by id: session_id
    elsif cookies_signed_id
      current_user_cookies cookies_signed_id
    end
  end

  def current_user_cookies cookies_signed_id
    user = User.find_by id: cookies_signed_id
    if user && user.authenticated?(cookies[:remember_token])
      log_in user
      @current_user = user
    end
  end

  def logged_in?
    current_user.present?
  end

  def forget user
    user.forget
    cookies.delete :user_id
    cookies.delete :remember_token
  end

  def log_out
    forget current_user
    session.delete :user_id
    @current_user = nil
  end
end
