class AddNicknameToUser < ActiveRecord::Migration
  def change
    add_column :users, :nickname, :string
    add_column :users, :head, :string
  end
end
