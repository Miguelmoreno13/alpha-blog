class ArticulosController < ApplicationController
  before_action :set_articulo, only: [:edit, :update, :show, :destroy]
  
  def index
    @articulos = Articulo.paginate(page: params[:page], per_page: 5)
  end
  
  def new
    @articulo = Articulo.new
  end
  
  def edit
  end
  
  def create
    @articulo = Articulo.new(articulo_parametros)
    @articulo.usuario = Usuario.first
    if @articulo.save
       flash[:success] = "El articulo fue creado exitosamente"
       redirect_to articulo_path(@articulo)
    else
      render 'new'
    end
  end
  
  def update
    if @articulo.update(articulo_parametros)
      flash[:success] = "El articulo fue actualizado correctamente"
      redirect_to articulo_path(@articulo)
    else
      render 'edit'
    end
  end
  
  def show
  end
  
  def destroy
    @articulo.destroy
    flash[:danger] = "El articulo fue eliminado"
    redirect_to articulos_path
  end
  
  private
    def set_articulo
      @articulo = Articulo.find(params[:id])
    end
    def articulo_parametros
    params.require(:articulo).permit(:titulo, :descripcion)
    end
    
end