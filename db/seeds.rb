
require 'faker'

Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all
City.destroy_all
Specialty.destroy_all
Caca.destroy_all

10.times do 

    coun = City.create!(city_name: Faker::Address.city )

end

start_country = City.first.id

10.times do 
    country = rand(0..9)
    total = country + start_country
    cool = City.find(total)

    doc = Doctor.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, zip_code: Faker::Number.number(digits: 5), city: cool)

end

50.times do 
    country = rand(0..9)
    total = country + start_country
    cool = City.find(total)

    doc = Patient.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city: cool )
end

ok = Doctor.first.id
ok2 = Patient.first.id

70.times do 

    country = rand(0..9)
    total = country + start_country
    cool = City.find(total)

    doc = rand(0..9)
    pat = rand(0..49)

    docnb = ok + doc
    test = Doctor.find(docnb)

    patnb = ok2 + pat
    test2 = Patient.find(patnb)

    ap = Appointment.create!(doctor: test, patient: test2, date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'), city: cool)
end

10.times do 
    coun = Specialty.create!(specialty_name: Faker::Address.city)
end

ok4 = Specialty.first.id

70.times do 

    doc = rand(0..9)
    spe = rand(0..9)

    docnb = ok + doc
    test = Doctor.find(docnb)

    patnb = ok4 + spe
    test2 = Specialty.find(patnb)
    puts test
    puts test2

    ap = Caca.create!(doctor: test, specialty: test2)
end
