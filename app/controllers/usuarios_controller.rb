class UsuariosController < ApplicationController
 
  def index
    @usuarios = Usuario.all
  end
 
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
  
  def edit
    @usuario = Usuario.find(params[:id])
  end
  
  def update
    @usuario = Usuario.find(params[:id])
    if @usuario.update(usuario_parametros)
      flash[:success] = "Tu cuenta fue actualizada correctamente"
      redirect_to articulos_path
    else
      render 'edit'
    end
  end
  
  def show
    @usuario = Usuario.find(params[:id])
  end
  
  private
  def usuario_parametros
    params.require(:usuario).permit(:usuario, :email, :password)
  end
end