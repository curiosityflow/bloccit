require 'rails_helper'

RSpec.describe Comment, type: :model do
   let(:topic) { Topic.create!(name: Faker::Lorem.sentence, description: Faker::Lorem.paragraph) }
   let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "helloworld") }
   let(:post) { topic.posts.create!(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph, user: user) }
   let(:comment) { Comment.create!(body: 'Comment Body', post: post) }

   describe "attributes" do
     it "responds to body" do
       expect(comment).to respond_to(:body)
     end
   end
end
