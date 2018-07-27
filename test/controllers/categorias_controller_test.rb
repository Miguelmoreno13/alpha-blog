require 'test_helper'

class CategoriasControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @categoria = Categoria.create(nombre: "deportes")
    @user = Usuario.create(usuario: "migue", email: "migue@ejemplo.com", password: "contra", admin: true)
  end
  
  test "debe tener indice de categorias" do
    get categorias_path
    assert_response :success
  end
  
  test "debe tener nuevo" do
    sign_in_as(@user, "contra")
    get new_categoria_path
    assert_response :success
  end
  
  test "debe mostrar" do
    get categoria_path(@categoria)
    assert_response :success
  end
  
  test "debe de redireccionar al crear cuando el admin no esta conectado" do 
    assert_no_difference 'Categoria.count' do
      post categorias_path, params: { categoria: {nombre: "deportes"} }
    end
    assert_redirected_to categorias_path
  end
  
end