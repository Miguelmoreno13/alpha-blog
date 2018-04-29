class AddUsuarioEnArticulos < ActiveRecord::Migration[5.1]
  def change
    add_column :articulos, :usuario_id, :integer 
  end
end
