# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all
City.destroy_all

10.times do 

    coun = City.create!(city_name: Faker::Address.city )

end

start_country = City.first.id

10.times do 
    country = rand(0..9)
    total = country + start_country
    cool = City.find(total)

    nb = rand(1..6)

    genree = ''
    if nb == 1
        genree = "Gynecologic"
    elsif nb == 2
        genree = "Generalist"
    elsif nb == 3
        genree = "Cardiothoracic"
    elsif nb == 4
        genree = "Toxicology"
    elsif nb == 5
        genree = "Oncology"
    else 
        genree = "Neuroradiology"
    end

    doc = Doctor.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, specialty: genree, zip_code: Faker::Number.number(digits: 5), city: cool)

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