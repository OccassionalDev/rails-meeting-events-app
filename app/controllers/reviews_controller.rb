class ReviewsController < ApplicationController
    before_action :require_login, only: [:new, :create]
    
    def index
        @event = Event.find(params[:event_id])
    end 
    
    def new
        @review = Review.new(event_id: params[:event_id])
    end 

    def create
        @review = Review.new(review_params)
        @review.user = current_user

        if @review.save 
            redirect_to root_url, notice: "Your review has been submitted."
        else 
            render "new"
        end 
    end 

    private

    def review_params(*args)
        params.require(:review).permit(:rating, :content, :event_id)
    end 
end 