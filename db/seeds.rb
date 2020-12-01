# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
require "open-uri"
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Creating 5 products...'
50.times do |i|
  costume = Costume.create!(
    name: Faker::Creature::Animal.name, #=> "Antelope",
    description: Faker::Food.description,
    price: rand(1..400),
    size: "m",
    user: User.first
    
  )

file = URI.open("https://picsum.photos/id/#{rand(0..300)}/200/300")
costume.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')

  puts "#{i + 1}. #{costume.name}"
end
puts 'Finished!'

