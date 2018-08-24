# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Post.destroy_all
Category.destroy_all
ranNum = 0
bool = true

8.times do |cat|
  ranNum = rand(1..2)
  if ranNum == 1
    bool = true
  else
    bool = false
  end
  Category.create!(
    name: Faker::Vehicle.manufacture,
    description: Faker::Lorem.paragraphs(3),
    display_in_navbar: bool
  )
end

puts "8 categories created"

20.times do |post|
  Post.create!(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraphs(10),
    category_id: rand(1..8)
  )
end

puts "20 posts created"