require 'rails_helper'

RSpec.describe PrivateMessage, type: :model do

  before(:each) do 
    @private_message = FactoryBot.create(:private_message)
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@private_message).to be_a(PrivateMessage)
      expect(@private_message).to be_valid
    end

    it "should return a string" do
        expect(@private_message.content).to be_a(String)
    end
#OK

  end

 end

  