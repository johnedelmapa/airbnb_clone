class AddEditinfoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :phonenumber, :string
    add_column :users, :description, :text
  end
end
