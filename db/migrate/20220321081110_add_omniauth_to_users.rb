class AddOmniauthToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :github_username, :string
    change_column :users, :email, :string, null: true
  end
end
