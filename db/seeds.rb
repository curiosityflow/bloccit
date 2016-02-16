require "random_data"
# Create Posts

10.times do
   SponsoredPost.create!(
     title: RandomData.random_sentence,
     body:  RandomData.random_paragraph,
     price: 8
)
end
sponsered_posts = SponsoredPost.all


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




puts "Seed finished"
puts "#{SponsoredPost.count} sponsored posts created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Question.count} questions created"