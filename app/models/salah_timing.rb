class SalahTiming < ApplicationRecord
  belongs_to :mosque

  def timing_now
    timing.in_time_zone("Asia/Kolkata")
  end
end
