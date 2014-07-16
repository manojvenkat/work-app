class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  def handle_unverified_request
  	sign_out
  	super
  end
  
	def save_login_state
		if session[:user_id]
			redirect_to(:controller => 'sessions', :action => 'home')
		return false
		else
			return true
		end
	end


end
