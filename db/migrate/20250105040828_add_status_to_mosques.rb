class AddStatusToMosques < ActiveRecord::Migration[8.0]
  def change
    add_column :mosques, :status, :string, default: :pending
  end
end
