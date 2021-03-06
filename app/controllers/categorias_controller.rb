class CategoriasController < ApplicationController
  before_action :require_admin, except: [:index, :show]
  
  def index
    @categorias = Categoria.paginate(page: params[:page], per_page: 5)
  end
  
  def new
    @categoria = Categoria.new
  end
  
  def create
    @categoria = Categoria.new(categoria_params)
    if @categoria.save
      flash[:success] = "Categoria fue creada exitosamente"
      redirect_to categorias_path
    else
      render 'new'
    end
  end
  
  def edit
    @categoria = Categoria.find(params[:id])
  end
  
  def update
    @categoria = Categoria.find(params[:id])
    if @categoria.update(categoria_params)
      flash[:success] = "Categoria actualizada"
      redirect_to categoria_path(@categoria)
    else render 'edit'
    end
  end
  
  def show
    @categoria = Categoria.find(params[:id])
    @categoria_articulos = @categoria.articulos.paginate(page: params[:page], per_page: 5 )
  end
  
  private
  def categoria_params
    params.require(:categoria).permit(:nombre)
  end
  
  def require_admin
    if !logged_in? || (logged_in? and !current_user.admin?)
      flash[:danger] = "Solo el administrador puede realizar esa accion"
      redirect_to categorias_path
    end
  end
  
end