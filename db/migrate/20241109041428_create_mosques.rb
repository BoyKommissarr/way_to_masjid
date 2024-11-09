class CreateMosques < ActiveRecord::Migration[7.2]
  def change
    create_table :mosques do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.text :google_link
      t.references :area, null: false, foreign_key: true

      t.timestamps
    end
  end
end
