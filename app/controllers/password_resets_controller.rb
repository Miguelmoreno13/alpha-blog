class PasswordResetsController < ApplicationController
  def new
    @usuario = Usuario.new
  end
  
  def create
  @usuario = Usuario.find_by_email(params[:usuario][:email])
    if @usuario.nil?
      flash[:danger] = 'Email no existe!'
      redirect_to new_password_reset_path
    else
      @usuario.send_password_reset if @usuario
      flash[:success] = 'Correo enviado con instrucciones de recuperacion de contraseña'
      redirect_to new_password_reset_path
    end
  end
  
  def edit
  @usuario = Usuario.find_by_password_reset_token!(params[:id])
  end
  
  def update
  @usuario = Usuario.find_by_password_reset_token!(params[:id])
  new_pass1 = params[:usuario][:password]
  new_pass2 = params[:usuario][:password_confirmation]
    if @usuario.password_reset_sent_at < 2.hour.ago
      flash[:danger] = 'Password reset has expired'
      redirect_to new_password_reset_path
        elsif(new_pass1 == new_pass2)
           @usuario.update(user_params)
           flash[:success] = 'Password has been reset!'
           redirect_to new_session_path
            else
              flash[:danger] = "La contraseña no coinciden"
              render :edit
    end
  end
  
  def show
  end

private
  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:usuario).permit(:password)
  end

end
