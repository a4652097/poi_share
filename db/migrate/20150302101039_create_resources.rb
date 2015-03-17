class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :title
      t.text :content
      t.integer :classification_id

      t.timestamps
    end
  end
end
