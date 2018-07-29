class AddPasswordResetToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :usuarios, :password_reset_token, :string
    add_column :usuarios, :password_reset_sent_at, :datetime
  end
end
