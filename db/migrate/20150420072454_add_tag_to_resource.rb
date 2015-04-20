class AddTagToResource < ActiveRecord::Migration
  def change
    add_column :resources, :tag, :integer
  end
end
