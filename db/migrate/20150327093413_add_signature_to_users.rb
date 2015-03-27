class AddSignatureToUsers < ActiveRecord::Migration
  def change
    add_column :users, :signature, :string
    add_column :users, :city, :string
  end
end
