class GossipController < ApplicationController
  def team
  end
def contact
end

def welcome
  @first_name=params[:first_name]
  puts '€'*60
  puts @first_name
  puts '€'*60
end

def home
	@gossips = Gossip.all
	 puts '€'*60
	 @gossips.each do |gossip|
		puts gossip.title
	end
	 puts '€'*60
end
end
