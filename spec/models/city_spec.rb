require 'rails_helper'

RSpec.describe City, type: :model do

  before(:each) do 
    @city = City.create(name: "Town_1")
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@city).to be_a(City)
      expect(@city).to be_valid
    end

    it "should return a string" do
        expect(@city.name).to be_a(String)
    end
#OK

  end

 end

  