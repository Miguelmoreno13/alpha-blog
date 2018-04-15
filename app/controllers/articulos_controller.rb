class ArticulosController < ApplicationController
  def new
    @articulo = Articulo.new
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
  
  def show
      @articulo = Articulo.find(params[:id]) 
  end
  
  private
    def articulo_parametros
    params.require(:articulo).permit(:titulo, :descripcion)
    end
    
end