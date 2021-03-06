# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all

steve_p = User.create!(first_name: 'Steve', last_name: 'Peterson', email: 'steve.peterson@octanner.com', avatar_url: '/images/steve.png')
steve_f = User.create!(first_name: 'Steve', last_name: 'Fairbanks', email: 'steve.fairbanks@octanner.com')

10.times do
  steve_p.appreciations.create!(points: 10)
end

10.times do
  steve_f.appreciations.create!(points: 10)
end
