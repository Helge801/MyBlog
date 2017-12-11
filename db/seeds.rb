# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

15.times do |i|
  mypass = RandomWord.adjs(not_shorter_than: 6, not_longer_than: 15).next
  myname = "#{RandomWord.nouns(not_shorter_than: 3, not_longer_than: 7).next.capitalize} #{RandomWord.adjs(not_shorter_than: 4, not_longer_than: 10).next.capitalize}"
  User.create!(email: "#{myname.gsub(/\s+/, "")}@mailer.com",
              password: mypass,
              password_confirmation: mypass,
              name: myname,
              username: myname.split.first + "123"
              )  
end
