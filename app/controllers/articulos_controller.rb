class ArticulosController < ApplicationController
  def new
    @articulo = Articulo.new
  end
  
  def create
    #render plain: params[:articulo].inspect
    @articulo = Articulo.new(articulo_parametros)
    @articulo.save
    redirect_to articulos_show(@articulo)
  end
  
  private
    def articulo_parametros
    params.require(:articulo).permit(:titulo, :descripcion)
    end
end