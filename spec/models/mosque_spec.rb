RSpec.describe Mosque, type: :model do
  describe "#next_salah_time" do
    let(:mosque) { create(:mosque) }
    let!(:salah_timings) do
      create(:salah_timing, :fajr, mosque:)
      create(:salah_timing, :zohr, mosque:)
      create(:salah_timing, :asr, mosque:)
      create(:salah_timing, :maghrib, mosque:)
      create(:salah_timing, :isha, mosque:)
    end

    it 'returns upcoming' do
      expect(mosque.next_salah_time).to eq(SalahTiming.second)
    end
  end
end
