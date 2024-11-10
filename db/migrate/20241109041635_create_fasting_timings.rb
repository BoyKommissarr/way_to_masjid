class CreateFastingTimings < ActiveRecord::Migration[7.2]
  def change
    create_table :fasting_timings do |t|
      t.time :sehri_start, null: false
      t.time :sehri_end, null: false
      t.time :iftaar, null: false

      t.timestamps
    end
  end
end
