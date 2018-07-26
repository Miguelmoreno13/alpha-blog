class CategoriasController < ApplicationController
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
  
  def show
  end
  
  private
  def categoria_params
    params.require(:categoria).permit(:nombre)
  end
  
end