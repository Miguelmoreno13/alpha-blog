class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  helper_method :current_user, :logged_in?, :reset_sesion
  
  def current_user
    @current_user ||= Usuario.find(session[:user_id]) if session[:user_id]
  end
  
  def reset_sesion
    if current_user?
      reset_session
    end
  end
  
  def logged_in?
    !!current_user
  end
  
  def require_user
    if !logged_in?
      flash[:danger] = "Debes iniciar sesión para realizar esta acción"
      redirect_to root_path
    end
  end
end
