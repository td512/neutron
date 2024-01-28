class AddUsernameSaltAndVerifiertoUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :text
    add_column :users, :salt, :text
    add_column :users, :verifier, :text
  end
end
