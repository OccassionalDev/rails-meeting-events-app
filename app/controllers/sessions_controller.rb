class SessionsController < ApplicationController
   
    # Login
    def new
    end 

    def create
        user = User.find_by_email(params[:email])

        if user && user.authenticate(params[:password])
            session[:user_id] = user.id 
            redirect_to root_url, notice: "Successfully logged in as #{user.full_name}"
        else 
            redirect_to login_path, alert: "Email or password is invalid"
        end 
    end 

    def destroy
        session.delete :user_id
        redirect_to root_url, notice: "You've been succesfully logged out of your account."
    end 
end 