class SessionsController < ApplicationController
   
    # Login
    def new
    end 

    def create
        
        # If logging in via omniauth route
        if auth_hash
            user = User.find_or_create_from_auth_hash(auth_hash)
            successful_login(user)
        else 
        # Regular Login
            user = User.find_by_email(params[:email])
            
            if user && user.authenticate(params[:password])
                successful_login(user)
            else 
                redirect_to login_path, alert: "Email or password is invalid"
            end 
        end 
    end 

    def destroy
        session.delete :user_id
        redirect_to root_url, notice: "You've been succesfully logged out of your account."
    end 

    private

    def successful_login(user)
        self.current_user = user
        redirect_to root_url, notice: "Successfully logged in as #{user.name}"
    end 
end 