class Mosque < ApplicationRecord
  belongs_to :area
  has_many :salah_timings, dependent: :destroy
  belongs_to :user

  def next_salah_time
    current_time = Time.now.utc.strftime("%H:%M")
    if current_time > salah_timings.last.timing.strftime("%H:%M")
      salah_timings.first
    else
      salah_timings.find { |st| st.timing.strftime("%H:%M") > current_time }
    end
  end
end
