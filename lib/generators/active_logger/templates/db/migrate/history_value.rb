class <%= logger_class_name %>Value < ActiveRecord::Migration
  def change
    create_table(:<%= logger_class_name.underscore %>_values) do |t|
      t.integer :<%= logger_class_name.underscore %>_id
      t.string :key
      t.string :value
      t.timestamps
    end
  end
end