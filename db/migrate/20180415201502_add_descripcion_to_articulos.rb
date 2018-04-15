class AddDescripcionToArticulos < ActiveRecord::Migration[5.1]
  def change
    add_column :articulos, :descripcion, :text
    add_column :articulos, :created_at, :datetime
    add_column :articulos, :updated_at, :datetime
  end
end
