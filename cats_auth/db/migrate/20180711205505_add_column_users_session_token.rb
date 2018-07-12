class AddColumnUsersSessionToken < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :session_token, :string
    
    add_index :users, :session_token, unique: true
  end
end
