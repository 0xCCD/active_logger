class MyHistoryValue < ActiveRecord::Migration
  def change
    create_table(:my_history_values) do |t|
      t.integer :my_history_id
      t.string :key
      t.text :value
      t.timestamps
    end
  end
end