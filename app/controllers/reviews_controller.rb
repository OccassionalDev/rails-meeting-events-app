class ReviewsController < ApplicationController
    before_action :require_login, only: [:new, :create]
    
    def index
        @event = Event.find(params[:event_id])
    end 
    
    def new
        if does_review_exist?(params[:event_id])
            redirect_to event_path(Event.find(params[:event_id])), alert: "You've already submitted a review for this event."
        else 
            @review = Review.new(event_id: params[:event_id])
        end 
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

    def does_review_exist?(event_id)
        review = current_user.reviews.find_by(event_id: event_id)
        !review.nil?
    end 
end 