class UsuariosController < ApplicationController
 before_action :set_usuario, only: [:edit, :update, :show]
 before_action :require_same_user, only: [:edit, :update, :destroy]
 before_action :require_admin, only: [:destroy]
 
  def index
    @usuarios = Usuario.paginate(page: params[:page], per_page: 2)
  end
 
  def new
    @usuario = Usuario.new
  end
  
  def create
    @usuario = Usuario.new(usuario_parametros)
    if @usuario.save
      session[:user_id] = @usuario.id
      flash[:success] = "Bienvenido al Blog #{@usuario.usuario}"
      redirect_to usuario_path(@usuario)
    else 
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @usuario.update(usuario_parametros)
      flash[:success] = "Tu cuenta fue actualizada correctamente"
      redirect_to articulos_path
    else
      render 'edit'
    end
  end
  
  def show
    @usuario_articulos = @usuario.articulos.paginate(page: params[:page], per_page: 5)
  end
  
  def destroy
    @usuario = Usuario.find(params[:id])
    @usuario.destroy
    flash[:danger] = "El usuario y todos sus articulos fueron eliminados"
    redirect_to usuarios_path
  end
  
  private
  def usuario_parametros
    params.require(:usuario).permit(:usuario, :email, :password)
  end
  
  def set_usuario
  @usuario = Usuario.find(params[:id])
  end
  
  def require_same_user
    if current_user != @usuario and !current_user.admin?
      flash[:danger] = "Solo puedes editar tu cuenta"
      redirect_to root_path
    end
  end
  
  def require_admin
    if logged_in? and !current_user.admin?
      flash[:danger] = "Solo el usuario administrador puede realizar esa acción"
      redirect_to root_path
    end
  end
end