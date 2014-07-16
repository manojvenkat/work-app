class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:show]

  def new
  	@user = User.new
  end

  def show
  	@user = User.find(params[:id])
  end

  def create
  	@user = User.new(params[:user])  	
  	if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Work Share app!"
  		redirect_to @user      
  	else
  		render 'new'
  	end
  end

  def signed_in_user
    redirect_to signin_url, notice: "Please Sign in." unless signed_in?
  end
end
