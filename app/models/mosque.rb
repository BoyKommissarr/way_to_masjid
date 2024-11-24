class Mosque < ApplicationRecord
  belongs_to :area
  has_many :salah_timings
  belongs_to :user
end
