require 'faker'


 5.times do
   user = User.new(
     name:     Faker::Name.name,
     email:    Faker::Internet.email,
     password: Faker::Lorem.characters(10)
   )
   user.skip_confirmation!
   user.save!
 end
 users = User.all

admin = User.new(
 name:     'Admin User',
 email:    'admin@example.com',
 password: 'helloworld'
)
admin.skip_confirmation!
admin.save!

# Create a moderator
moderator = User.new(
 name:     'normal User',
 email:    'normal@example.com',
 password: 'helloworld',
)
moderator.skip_confirmation!
moderator.save!

# Create a member
member = User.new(
 name:     'Yuqi',
 email:    'yuqi.qian@outlook.com',
 password: '88888888'
)
member.skip_confirmation!
member.save!
users = User.all

15.times do
  Topic.create!(
    user: users.sample,
    title: Faker::Lorem.sentence
  )
end
topics = Topic.all

50.times do
  bookmark = Bookmark.create!(
    topic: topics.sample,
    url: Faker::Internet.url
    )
end
bookmarks = Bookmark.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Bookmark.count} bookmarks created"