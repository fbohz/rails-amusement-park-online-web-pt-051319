class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :authenticate_user

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    !!current_user
  end

  def authenticate_user
    if !logged_in? 
      redirect_to root_path
    end 
  end  

  def login(user)
    session[:user_id] = user.id
  end 

  def admin?(user)
    if user.admin 
        session[:user_id] = user.id
    end
  end 
end
