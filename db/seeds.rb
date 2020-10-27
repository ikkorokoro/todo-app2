# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
jon = User.create!(email: 'john@example.com', password: 'password')
emiry = User.create!(email: 'emily@example.com', password: 'password')

5.times do #5回繰り返す
  jon.articles.create!(
    name: Faker::Lorem.sentence(word_count: 5),
    description: Faker::Lorem.sentence(word_count: 30)
)
end

5.times do
  emiry.articles.create!(
    name: Faker::Lorem.sentence(word_count: 5),
    description: Faker::Lorem.sentence(word_count: 50)
)
end