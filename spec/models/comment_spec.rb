require 'rails_helper'

RSpec.describe Comment, type: :model do
   let(:topic) { Topic.create!(name: Faker::Lorem.sentence, description: Faker::Lorem.paragraph) }
   let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "helloworld") }
   let(:post) { topic.posts.create!(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph, user: user) }
   let(:comment) { Comment.create!(body: 'Comment Body', post: post, user: user) }
   
     it { is_expected.to belong_to(:post) }
     it { is_expected.to belong_to(:user) }
     it { is_expected.to validate_presence_of(:body) }
     it { is_expected.to validate_length_of(:body).is_at_least(5) }
   describe "attributes" do
     it "responds to body" do
       expect(comment).to respond_to(:body)
     end
   end
end
