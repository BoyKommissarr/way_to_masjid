class Mosque < ApplicationRecord
  belongs_to :area
  has_many :salah_timings
  belongs_to :user

  def next_salah_time
    salah_timings.second
  end
end
