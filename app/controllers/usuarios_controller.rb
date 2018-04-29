class UsuariosController < ApplicationController
  def new
    @usuario = Usuario.new
  end
  
  def create
    @usuario = Usuario.new(usuario_parametros)
    if @usuario.save
      flash[:success] = "Bienvenido al Blog #{@usuario.usuario}"
      redirect_to articulos_path
    else 
      render 'new'
    end
  end
  
  private
  def usuario_parametros
    params.require(:usuario).permit(:usuario, :email, :password)
  end
end