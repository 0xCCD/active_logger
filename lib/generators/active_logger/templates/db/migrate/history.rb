class <%= logger_class_name %> < ActiveRecord::Migration
  def change
    create_table(:<%= logger_class_name.pluralize.underscore %>) do |t|
      t.string :body
      t.string :user_id
      t.string :logged_for_id
      t.string :logged_for
      t.integer :level
      t.boolean :i18n
      t.text :detail
      t.timestamps
    end
  end
end