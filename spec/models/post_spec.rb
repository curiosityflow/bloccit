require 'rails_helper'

RSpec.describe Post, type: :model do
   # #1
   let(:topic) { Topic.create!(name: Faker::Lorem.sentence, description: Faker::Lorem.paragraph) }
   let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "helloworld") }
 # #4
   let(:post) { topic.posts.create!(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph, user: user) }

   it { is_expected.to have_many(:labelings) }
   it { is_expected.to have_many(:labels).through(:labelings) }
   it { is_expected.to have_many(:comments) }
   it { is_expected.to belong_to(:topic) }

   it { is_expected.to validate_presence_of(:title) }
   it { is_expected.to belong_to(:user) }
   it { is_expected.to validate_presence_of(:body) }
   it { is_expected.to validate_presence_of(:topic) }
   it { is_expected.to validate_presence_of(:user) }
 # 2
   it { is_expected.to validate_length_of(:title).is_at_least(5) }
   it { is_expected.to validate_length_of(:body).is_at_least(20) }

   describe "attributes" do
 # #2
     it "responds to title" do
       expect(post).to respond_to(:title)
     end
 # #3
     it "responds to body" do
       expect(post).to respond_to(:body)
     end
   end
end
