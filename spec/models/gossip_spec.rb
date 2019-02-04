require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do 
    @gossip = FactoryBot.create(:gossip)
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@gossip).to be_a(Gossip)
      expect(@gossip).to be_valid
    end

    it "should return a string" do
        expect(@gossip.title).to be_a(String)
    end
#OK

  end

 end

  