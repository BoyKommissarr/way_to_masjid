# Inserting records for masjids
ActiveRecord::Base.transaction do
    puts ".........Inserting Areas .........."

    kb = Area.create!(area_name: "Kondhwa Budhruk") # For single record insertion
    kk = Area.create!(area_name: "Kondhwa Khurd")
    pg = Area.create!(area_name: "Parge Nagar")
    kausar = Area.create!(area_name: "Kausar Baug")
    nibm = Area.create!(area_name: "NIBM")

    puts "...........Inserting Admins.............."
    admin_1 = User.create!(email: 'parge_admin@gmail.com', password: 'password', full_name: "Bismillah Khan")
    admin_2 = User.create!(email: 'kausar_admin@gmail.com', password: 'password', full_name: "Kausar Miyan")
    admin_3 = User.create!(email: 'kondhwa_budhrukadmin@gmai.com', password: 'password', full_name: "Baba Budhruk")

    puts ".........Inserting Masjids .........."
    tooba = Mosque.create!(name: "tooba Masjid", address: "Parge Nagar", area_id: pg.id)
    irc = Mosque.create!(name: "Islamic Research Center", address: "Parge Nagar", area_id: pg.id)
    taalab = Mosque.create!(name: "Taalab Masjid", address: "Kondhwa Budhruk", area_id: kb.id)
    kausar_baug = Mosque.create!(name: "Kausar Baug Masjid", address: "Kausar Baug", area_id: kb.id)
    safaa = Mosque.create!(name: "Safaa Masjid", address: "Kondhwa Budhruk", area_id: kb.id)


    puts "........tooba masjid salah timing........."
    SalahTiming.create!(name: "Fajar", timing: Time.new("01", "01", "01", "06", "10"), mosque_id: tooba.id)
    SalahTiming.create!(name: "Zohar", timing: Time.new("01", "01", "01", "01", "30"), mosque_id: tooba.id)
    SalahTiming.create!(name: "Asar", timing: Time.new("01", "01", "01", "04", "30"), mosque_id: tooba.id)
    SalahTiming.create!(name: "Maghrib", timing: Time.new("01", "01", "01", "06", "05"), mosque_id: tooba.id)
    SalahTiming.create!(name: "Isha", timing: Time.new("01", "01", "01", "08", "15"), mosque_id: tooba.id)

    puts "........tooba irc salah timing........."

    SalahTiming.create!(name: "Fajar", timing: Time.new("01", "01", "01", "06", "15"), mosque_id: irc.id)
    SalahTiming.create!(name: "Zohar", timing: Time.new("01", "01", "01", "01", "15"), mosque_id: irc.id)
    SalahTiming.create!(name: "Asar", timing: Time.new("01", "01", "01", "04", "45"), mosque_id: irc.id)
    SalahTiming.create!(name: "Maghrib", timing: Time.new("01", "01", "01", "06", "05"), mosque_id: irc.id)
    SalahTiming.create!(name: "Isha", timing: Time.new("01", "01", "01", "08", "15"), mosque_id: irc.id)

    puts "........tooba talaab salah timing........."

    SalahTiming.create!(name: "Fajar", timing: Time.new("01", "01", "01", "06", "15"), mosque_id: taalab.id)
    SalahTiming.create!(name: "Zohar", timing: Time.new("01", "01", "01", "01", "15"), mosque_id: taalab.id)
    SalahTiming.create!(name: "Asar", timing: Time.new("01", "01", "01", "04", "45"), mosque_id: taalab.id)
    SalahTiming.create!(name: "Maghrib", timing: Time.new("01", "01", "01", "06", "05"), mosque_id: taalab.id)
    SalahTiming.create!(name: "Isha", timing: Time.new("01", "01", "01", "08", "15"), mosque_id: taalab.id)

    puts "........tooba kausar baug salah timing........."

    SalahTiming.create!(name: "Fajar", timing: Time.new("01", "01", "01", "06", "15"), mosque_id: kausar_baug.id)
    SalahTiming.create!(name: "Zohar", timing: Time.new("01", "01", "01", "01", "15"), mosque_id: kausar_baug.id)
    SalahTiming.create!(name: "Asar", timing: Time.new("01", "01", "01", "04", "45"), mosque_id: kausar_baug.id)
    SalahTiming.create!(name: "Maghrib", timing: Time.new("01", "01", "01", "06", "05"), mosque_id: kausar_baug.id)
    SalahTiming.create!(name: "Isha", timing: Time.new("01", "01", "01", "08", "15"), mosque_id: kausar_baug.id)

    puts "........tooba safaa salah timing........."

    SalahTiming.create!(name: "Fajar", timing: Time.new("01", "01", "01", "06", "15"), mosque_id: safaa.id)
    SalahTiming.create!(name: "Zohar", timing: Time.new("01", "01", "01", "01", "15"), mosque_id: safaa.id)
    SalahTiming.create!(name: "Asar", timing: Time.new("01", "01", "01", "04", "45"), mosque_id: safaa.id)
    SalahTiming.create!(name: "Maghrib", timing: Time.new("01", "01", "01", "06", "05"), mosque_id: safaa.id)
    SalahTiming.create!(name: "Isha", timing: Time.new("01", "01", "01", "08", "15"), mosque_id: safaa.id)
end
