class UsersController < ApplicationController

    def home
    end 

    # Sign-Up
    def new
        @user = User.new
    end 

    def create
        @user = User.create(user_params)

        return redirect_to controller: 'users', action: 'new' unless @user.save
        session[:user_id] = @user.id
        redirect_to(controller: 'users', action: 'home')
    end 

  private 
  
  def user_params(*args) 
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end 
end 