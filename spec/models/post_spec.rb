require 'rails_helper'

RSpec.describe Post, type: :model do

  before(:each) do 
    @post = FactoryBot.create(:post)
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@post).to be_a(Post)
      expect(@post).to be_valid
    end

    it "should return a string" do
        expect(@post.tag.title).to be_a(String)
    end
#OK

  end

 end

  