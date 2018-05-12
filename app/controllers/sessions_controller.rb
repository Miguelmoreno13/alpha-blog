class SessionsController < ApplicationController

  def new
  end
  
  def create
    user = Usuario.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Haz ingresado exitosamente!"
      redirect_to usuario_path(user)
    else
      flash.now[:danger] = "Hubo un problema con tu informacion de inicio de sesión"
      render 'new'
    end
    
  end
  
  def destroy
    session[:user_id] = nil
    flash[:success] = "Te has desconectado"
    redirect_to root_path
  end

end