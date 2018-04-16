class ArticulosController < ApplicationController
  before_action :set_articulo, only: [:edit, :update, :show, :destroy]
  
  def index
    @articulos = Articulo.all
  end
  
  def new
    @articulo = Articulo.new
  end
  
  def edit
  end
  
  def create
    @articulo = Articulo.new(articulo_parametros)
    if @articulo.save
       flash[:notice] = "El articulo fue creado exitosamente"
       redirect_to articulo_path(@articulo)
    else
      render 'new'
    end
  end
  
  def update
    if @articulo.update(articulo_parametros)
      flash[:notice] = "El articulo fue actualizado correctamente"
      redirect_to articulo_path(@articulo)
    else
      render 'edit'
    end
  end
  
  def show
  end
  
  def destroy
    @articulo.destroy
    flash[:notice] = "El articulo fue eliminado"
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