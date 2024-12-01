class AddUniquenessToAreaNameInAreaTable < ActiveRecord::Migration[7.2]
  def change
    add_index :areas, :area_name, unique: true
  end
end
