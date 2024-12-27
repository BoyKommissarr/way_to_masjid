RSpec.describe Mosque, type: :model do
  describe "next_salah_time" do
    let(:mosque) { create(:mosque) }
    let!(:salah_timings) do
      create(:salah_timing, :fajr, mosque:)
      create(:salah_timing, :zohr, mosque:)
      create(:salah_timing, :asr, mosque:)
      create(:salah_timing, :maghrib, mosque:)
      create(:salah_timing, :isha, mosque:)
    end

    it 'returns upcoming' do
      allow(Time).to receive(:now).and_return(Time.new("2024-12-26 14:00:00.00 +0530"))
      expect(mosque.next_salah_time.name).to eq('Asr')
    end

    it 'case 1 : 00:00 to Fajr' do
      allow(Time).to receive(:now).and_return(Time.new("2024-12-26 01:30:00.00 +0530"))
      expect(mosque.next_salah_time.name).to eq('Fajr')
    end

    it 'case 2 : Fajr to Zohr' do
      allow(Time).to receive(:now).and_return(Time.new("2024-12-26 11:30:00.00 +0530"))
      expect(mosque.next_salah_time.name).to eq('Zohr')
    end

    it 'case 3 : Zohr to Asr' do
      allow(Time).to receive(:now).and_return(Time.new("2024-12-26 16:30:00.00 +0530"))
      expect(mosque.next_salah_time.name).to eq('Asr')
    end

    it 'case 4 : Asr to Maghrib' do
      allow(Time).to receive(:now).and_return(Time.new("2024-12-26 17:30:00.00 +0530"))
      expect(mosque.next_salah_time.name).to eq('Maghrib')
    end

    it 'case 5 : Maghrib to Isha' do
      allow(Time).to receive(:now).and_return(Time.new("2024-12-26 20:00:00.00 +0530"))
      expect(mosque.next_salah_time.name).to eq('Isha')
    end

    it 'case 6 : Isha to 00:00' do
      allow(Time).to receive(:now).and_return(Time.new("2024-12-26 23:30:00.00 +0530"))
      expect(mosque.next_salah_time.name).to eq('Fajr')
    end
  end
end
