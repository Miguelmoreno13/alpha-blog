require 'test_helper'

class CreateCategoriasTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = Usuario.create(usuario: "migue", email: "migue@ejemplo.com", password: "contra", admin: true)
  end
  
  test "conseguir nueva forma de categoria y crear categoria" do
    sign_in_as(@user, "contra")
    get new_categoria_path
    assert_template 'categorias/new'
    assert_difference 'Categoria.count', 1 do 
      post categorias_path, params: { categoria: {nombre: "deportes"} }
    follow_redirect!
    end
    assert_template 'categorias/index'
    assert_match "deportes", response.body
  end
  
  test "categoria invalida con resultados en fallo" do
    sign_in_as(@user, "contra")
    get new_categoria_path
    assert_template 'categorias/new'
    assert_no_difference 'Categoria.count' do 
      post categorias_path, params: { categoria: {nombre: ""} }
    end
    assert_template 'categorias/new'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end
  
  
end