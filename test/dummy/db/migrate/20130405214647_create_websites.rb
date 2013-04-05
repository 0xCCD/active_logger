class CreateWebsites < ActiveRecord::Migration
  def change
    create_table :websites do |t|
      t.string :headline
      t.text :body
      t.text :keywords
      t.text :head
      t.boolean :active

      t.timestamps
    end
  end
end
