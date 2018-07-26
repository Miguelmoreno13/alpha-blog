require 'test_helper'

class CategoriasControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @categoria = Categoria.create(nombre: "deportes")
  end
  
  test "debe tener indice de categorias" do
    get categorias_path
    assert_response :success
  end
  
  test "debe tener nuevo" do
    get new_categoria_path
    assert_response :success
  end
  
  test "debe mostrar" do
    get categoria_path(@categoria)
    assert_response :success
  end
  
end