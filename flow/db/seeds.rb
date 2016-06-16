# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

authors = ["Bill", "Steve", "Dave", "Sara", "Link", "Walter", "Mario", "Bowser"]






20.times do
  Article.create(author:Faker::Book.author,
                  title: Faker::Book.title,
                  body: Faker::Lorem.paragraphs(3).join(' '),)
end


50.times do
  Comment.create(article_id: rand(1..20),
                  author: authors[rand(0..7)],
                  body: Faker::Hacker.say_something_smart)
end