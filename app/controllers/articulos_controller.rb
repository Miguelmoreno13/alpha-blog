class ArticulosController < ApplicationController
  def index
    @articulos = Articulo.all
  end
  
  def new
    @articulo = Articulo.new
  end
  
  def edit
    @articulo = Articulo.find(params[:id])
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
    @articulo = Articulo.find(params[:id])
    if @articulo.update(articulo_parametros)
      flash[:notice] = "El articulo fue actualizado correctamente"
      redirect_to articulo_path(@articulo)
    else
      render 'edit'
    end
  end
  
  def show
      @articulo = Articulo.find(params[:id]) 
  end
  
  def destroy
    @articulo = Articulo.find(params[:id])
    @articulo.destroy
    flash[:notice] = "El articulo fue eliminado"
    redirect_to articulos_path
  end
  
  private
    def articulo_parametros
    params.require(:articulo).permit(:titulo, :descripcion)
    end
    
end