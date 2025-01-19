class AddNullConstraintsToUsersRole < ActiveRecord::Migration[8.0]
  def up
    change_column_null :users, :role, false
  end

  def down
    change_column_null :users, :role
  end
end
