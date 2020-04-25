class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end 

  def home
    @events = Event.all
  end 

  # Sign-Up
  def new
      @user = User.new
  end 

  def create
      @user = User.create(user_params)

      if @user.save
        session[:user_id] = @user.id
        redirect_to root_url, notice: "Account succesfully created!"
      
      else 
        render "new"
      end 
  end 

  private 

  def user_params(*args) 
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end 
end 