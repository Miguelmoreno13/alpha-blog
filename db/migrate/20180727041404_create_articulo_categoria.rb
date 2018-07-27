class CreateArticuloCategoria < ActiveRecord::Migration[5.1]
  def change
    create_table :articulo_categoria do |t|
      t.integer :articulo_id
      t.integer :categoria_id
    end
  end
end
