module ApplicationHelper

  # Logs in the given user.
  def log_in(user)
    cookies.permanent[:remember_token] = user.remember_token
  end

  # Current User
  def current_user
    @current_user ||= User.find_by(remember_token: cookies[:remember_token])
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  # Logs out current users
  def log_out
    cookies.delete :remember_token
  end

end
