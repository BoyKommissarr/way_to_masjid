FactoryBot.define do
  factory :salah_timing do
    name { 'Zohr' }
    timing { Time.new("01", "01", "01", "13", "30", "00", "+0530") }
    mosque

    trait :fajr do
      name { 'Fajr' }
      timing { Time.new("01", "01", "01", "06", "30", "00", "+0530") }
    end

    trait :zohr do
      name { 'Zohr' }
      timing { Time.new("01", "01", "01", "13", "30", "00", "+0530") }
    end

    trait :asr do
      name { 'Asr' }
      timing { Time.new("01", "01", "01", "17", "30", "00", "+0530") }
    end

    trait :maghrib do
      name { 'Maghrib' }
      timing { Time.new("01", "01", "01", "18", "15", "00", "+0530") }
    end

    trait :isha do
      name { 'Isha' }
      timing { Time.new("01", "01", "01", "20", "15", "00", "+0530") }
    end
  end
end
