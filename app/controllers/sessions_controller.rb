class SessionsController < ApplicationController

	before_filter :save_login_state, :only => [:index, :signin, :signup]

	def new

	end

	def create
		user = User.find_by_name(params[:session][:email].downcase)
		auth = (user.password == params[:session][:password])

		if user && auth
			sign_in user
			flash[:success] = "Welcome to Work Share app."
			redirect_to user
		else
			flash[:error] = 'Invalid id/password combination.'
			flash[:color] = "Invalid"
			render 'new'
		end
	end

	def signout
		sign_out
		redirect_to signin_path
	end

	def newGroup
		create_group(group_title)
	end

end
