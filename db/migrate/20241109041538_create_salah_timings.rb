class CreateSalahTimings < ActiveRecord::Migration[7.2]
  def change
    create_table :salah_timings do |t|
      t.string :name, null: false
      t.time :timing, null: false
      t.references :mosque, null: false, foreign_key: true

      t.timestamps
    end
  end
end
