class AlterUsersTable < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :full_name, :string, null: false
    add_column :users, :phone_number, :string
  end
end
