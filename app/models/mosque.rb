class Mosque < ApplicationRecord
  belongs_to :area
  has_many :salah_timings
end
