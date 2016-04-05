require "random_data"

# Create Posts
5.times do
   User.create!(
 # #3
   name:     RandomData.random_name,
   email:    RandomData.random_email,
   password: RandomData.random_sentence
   )
end
users = User.all


15.times do
   Topic.create!(
     name:         RandomData.random_sentence,
     description:  RandomData.random_paragraph
   )
end
topics = Topic.all

50.times do
# #1
   post = Post.create!(
     user:   users.sample,
# #2
     topic:  topics.sample,
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )

   post.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)

   rand(1..5).times { post.votes.create!(value: [-1, 1].sample, user: users.sample) }
end
posts = Post.all

# Create Comments
# #3
100.times do
    Comment.create!(
    # #4
     user: users.sample,
     post: posts.sample,
     body: RandomData.random_paragraph
    )
end

100.times do
    Question.create!(
    # #4
     title: RandomData.random_sentence,
     body: RandomData.random_paragraph,
     resolved: false
    )
end

admin = User.create!(
   name:     'Admin User',
   email:    'admin@example.com',
   password: 'helloworld',
   role:     'admin'
)


member = User.create!(
   name:     'Member User',
   email:    'member@example.com',
   password: 'helloworld'
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{SponsoredPost.count} sponsored posts created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Question.count} questions created"
puts "#{Vote.count} votes created"
