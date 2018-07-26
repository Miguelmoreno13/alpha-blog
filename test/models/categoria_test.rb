require 'test_helper'

class CategoriaTest < ActiveSupport::TestCase
  
  def setup
    @categoria = Categoria.new(nombre: "deportes")
  end
  
  test "Categoria debe ser valida" do
    assert @categoria.valid?  
  end
  
  test "nombre de estar presente" do
    @categoria.nombre = ""
    assert_not @categoria.valid?
  end
  
  test "nombre debe ser unico" do
    @categoria.save
    categoria2 = Categoria.new(nombre: "deportes")
    assert_not categoria2.valid?
  end
  
  test "nombre no debe ser tan largo" do
    @categoria.nombre = "a" * 26
    assert_not @categoria.valid?
  end
  
  test "nombre no debe ser tan corto" do
    @categoria.nombre = "aa"
    assert_not @categoria.valid?
  end
end