
10.times do |post|
  Post.create!(
    title: Faker::Hipster.sentence, 
    body: Faker::Hipster.paragraph(20), 
  )
end
puts '10 posts have been created'