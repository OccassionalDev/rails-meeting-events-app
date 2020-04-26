class ReservationsController < ApplicationController
    before_action :require_login

    def index
        @event = Event.find(params[:event_id])

        if @event.nil?
            redirect_to root_url, alert: "Event does not exist."
        else  
            @attending_users = @event.attending_users
        end 
    end 
    
    def create 
        @event = Event.find(params[:event_id])

        if @event.nil?
            redirect_to root_url, alert: "Event cannot be reserved to, as it no longer exists."
        else 
            current_user.reserved_events << @event
        end 
    end 

    def destroy
        @reservation = Reservation.find_by(event_id: params[:event_id], user_id: current_user.id)
        @reservation.delete
        redirect_to root_url, notice: "Your reservation has been canceled."
    end 
end 