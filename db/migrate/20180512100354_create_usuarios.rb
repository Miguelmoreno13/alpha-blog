class CreateUsuarios < ActiveRecord::Migration[5.1]
  def change
    create_table :usuarios do |t|
      t.string :usuario
      t.string :email
      t.timestamps
    end
  end
end
