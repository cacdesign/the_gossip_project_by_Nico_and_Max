class AuthorsController < ApplicationController
  def show
    @id=params[:id]
    @author=User.find(@id)
    @city_id = @author.city.id
end

	def new

	end

	def create


	#post_params = params.permit(:user_city, :user_zip_code, :user_first_name, :user_last_name, :user_email, :user_age)

	@city = City.create(name: params["user_city"], zip_code: params["user_zip_code"])	
	puts "$" *24
	puts @user = User.new(first_name: params["user_first_name"], last_name: params["user_last_name"], email:params["user_email"], age: params["user_age"], password: params["user_password"], city: @city, password: params["user_description"])
	#@user = User.new(post_params)
	puts "$" *24
		if @user.save
			flash[:success] = "Well done MF"
			puts @user.errors
			redirect_to gossips_path
		else
			puts @user.errors
			render 'new'
		end

	end

private

	def details

	end


end
 