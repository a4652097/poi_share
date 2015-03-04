class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :title
      t.string :content
      t.integer :classification_id

      t.timestamps
    end
  end
end
