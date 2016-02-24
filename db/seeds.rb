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
    Post.create!(
     user:   users.sample,
# #2
     topic:  topics.sample,
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
    )
end
posts = Post.all

# Create Comments
# #3
100.times do
    Comment.create!(
    # #4
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

user = User.first
user.update_attributes!(
   email: 'bmt49@zips.uakron.edu',
   password: 'helloworld'
)




puts "Seed finished"
puts "#{User.count} users created"
puts "#{SponsoredPost.count} sponsored posts created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Question.count} questions created"