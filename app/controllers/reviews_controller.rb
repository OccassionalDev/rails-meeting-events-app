class ReviewsController < ApplicationController
    before_action :require_login
    
    def index
    end 
    
    def new
        @review = current_user.event_reviews.build
    end 

    def create
        @review = current_user.event_reviews.build(review_params)

        if @review.save 
            redirect_to root_url, notice: "Your review has been submitted."
        else 
            render "new"
        end 
    end 

    private

    def review_params(*args)
        params.require(:review).permit(:rating, :content)
    end 
end 