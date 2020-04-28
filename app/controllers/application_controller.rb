class ApplicationController < ActionController::Base
    helper_method :current_user 
    helper_method :logged_in?
    helper_method :is_event_creator?
    helper_method :can_reserve?
    helper_method :can_edit_remove_and_view_event_reservations?
    helper_method :can_create_review?


    def current_user=(user)
        session[:user_id] = user.id 
    end 

    def current_user
        User.find_by(id: session[:user_id])
    end 

    def logged_in?
        current_user != nil
    end 

    def is_event_creator?(event)
        current_user.id == event.user_id
    end 

    def can_reserve?(event)
        logged_in? && !is_event_creator?(event)
    end 

    def can_edit_remove_and_view_event_reservations?(event)
        logged_in? && is_event_creator?(event)
    end 

    def can_create_review?(event)
        logged_in? && !is_event_creator?(event) && current_user.reserved_events.include?(event) && current_user.reviews.find_by(event_id: event.id).nil?
    end 

    private 

    def require_login 
        redirect_to root_url, alert: "You must be logged in to access this page." unless logged_in?
    end
end
