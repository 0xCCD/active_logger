class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :username
      t.string :encrypted_password
      t.datetime :last_login_at
      t.datetime :remember_created_at
      t.boolean :active

      t.timestamps
    end
  end
end
