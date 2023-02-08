class AddIndexToUsersEmail < ActiveRecord::Migration[7.0]
  def change
    add_index :users, :email, unique: true, name: "index_users_on_email"
  end
end
