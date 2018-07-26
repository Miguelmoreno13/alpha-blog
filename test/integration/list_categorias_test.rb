require 'test_helper'

class ListCategoriasTest < ActionDispatch::IntegrationTest
  
  def setup
    @categoria = Categoria.create(nombre: "deportes")
    @categoria1 = Categoria.create(nombre: "programacion")
  end
  
  test 'debe mostrar la lista de las categorias' do
    get categorias_path
    assert_template 'categorias/index'
    assert_select "a[href=?]", categoria_path(@categoria), text: @categoria.nombre
    assert_select "a[href=?]", categoria_path(@categoria1), text: @categoria1.nombre
  end
  
end