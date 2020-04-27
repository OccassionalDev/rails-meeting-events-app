class ReservationsController < ApplicationController
    before_action :require_login

    def index
        @event = Event.find(params[:event_id])

        if @event.nil?
            redirect_to root_url, alert: "Event does not exist."
        end 
    end 

    def destroy
        @reservation = Reservation.find_by(params[:id]).destroy
        redirect_to root_url, notice: "Your reservation has been canceled."
    end 
end 