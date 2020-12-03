# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
require "open-uri"
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
["wedding", "carnival", "party", "halloween"].each { |n| Tag.create(name: n) }

30.times do |i|
  user = User.create!(
    first_name: Faker::Creature::Animal.name, #=> "Antelope",
    last_name: Faker::Creature::Animal.name, #=> "Antelope",
    email: "email#{rand(1..10000)}@gmail.com",
    password: "password"
  )
end

puts 'Creating 15 Costumes...'
15.times do |i|
  costume = Costume.create!(
    name: Faker::Creature::Animal.name, #=> "Antelope",
    description: Faker::Food.description,
    city: Faker::Address.city,
    price: rand(1..400),
    size: "m",
    user: User.all.sample

  )

begin
  file = URI.open("https://picsum.photos/id/#{rand(0..300)}/200/300")
  costume.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
rescue
  costume.destroy
end
  puts "#{i + 1}. #{costume.name}"
end
puts 'Finished!'

