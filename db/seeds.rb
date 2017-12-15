# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
p "*" * 50
p "Preparing to create regular User"
p "*" * 50
User.create!(email: "hello@hello.com",
              password: "asdfasdf",
              password_confirmation: "asdfasdf",
              name: "Sample User",
              username: "Helge801"
              )
p "*" * 50
p "Regular User created"
p "login with:"
p " email: hello@hello.com"
p "password: asdfasdf"
p "*" * 50
p "creating admin user"
p "*" * 50

thisisadmin = User.create!(email: "goodbye@goodbye.com",
              password: "asdfasdf",
              password_confirmation: "asdfasdf",
              name: "Sample admin",
              username: "Helge801",
              roles: "admin"
              )
p "*" * 50
p "Admin User created"
p "login with:"
p "email: goodbye@goodbye.com"
p "password: asdfasdf"
p "*" * 50
p "creating random users"
p "*" * 50

15.times do |i|
  mypass = RandomWord.adjs(not_shorter_than: 6, not_longer_than: 15).next
  myname = "#{RandomWord.nouns(not_shorter_than: 3, not_longer_than: 7).next.capitalize} #{RandomWord.adjs(not_shorter_than: 4, not_longer_than: 10).next.capitalize}"
  User.create!(email: "#{myname.gsub(/\s+/, "")}@mailer.com",
              password: mypass,
              password_confirmation: mypass,
              name: myname,
              username: myname.split.first + "123"
              )  
  p "Created User: #{myname}"
end
p "*" * 50
p "finished with users, moving to blogs"
p "*" * 50
  user_count = User.count
(user_count * 3).times do |i|
  mybody = Array.new([*10..30].sample) {RandomWord.adjs.next}.join(" ")
  mytitle = RandomWord.nouns(not_shorter_than: 8, not_longer_than: 20).next
  Blog.create(title: mytitle,
           body: mybody,
           image: "http://unsplash.it/#{[*290..310].sample}/#{[*190..210].sample}?random",
           user_id: [*1..user_count].sample
           )
  p "Created Blog #{mytitle}"
end

p "*" * 50
p "finished with Blogs, moving to Posts"
p "*" * 50
postsmade = 1
blog_count = Blog.count
(blog_count * 5).times do |i|
  mybody = Array.new([*30..300].sample) {RandomWord.nouns.next}.join(" ")
  myblognumber = [*1..blog_count].sample
  Post.create( body: mybody, blog_id: myblognumber )
  p "#{postsmade} Post created for Blog number #{myblognumber}"
  postsmade += 1
end

p "*" * 50
p "finished with Posts, moving to Comments"
p "*" * 50

(blog_count * 3).times do |i|
  mybody = Array.new([*5..15].sample) {RandomWord.nouns.next}.join(" ")
  Comment.create(body: mybody,
                 user_id: [*1..user_count].sample,
                 blog_id: [*1..blog_count].sample)
  p "comment created"
end

p "*" * 50
p "finished with comments"
p "*" * 50


