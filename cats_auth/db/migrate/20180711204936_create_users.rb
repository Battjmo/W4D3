class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :user_name, null:false
      t.string :password_digest
    end
    add_index :users, :user_name, unique: true
  end
end