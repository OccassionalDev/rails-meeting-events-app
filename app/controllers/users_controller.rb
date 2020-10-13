class UsersController < ApplicationController
  before_action :require_login, only: [:dashboard]

  def show
    @user = User.find(params[:id])
  end 

  def home
    @events = Event.all.order("date DESC")
  end 

  def dashboard
  end 

  def account_settings
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
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end 
end 