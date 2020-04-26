class EventsController < ApplicationController
    before_action :require_login, only: [:new, :create, :edit, :update]
    
    def index
    end 

    def show
        @event = Event.find(params[:id])

        if can_reserve(@event)
            @reservation = Reservation.find_by(event_id: params[:id], user_id: current_user.id)
        end 
    end 

    # Creating a new event
    def new 
        @event = current_user.events.build
    end 

    def create
        @event = current_user.events.build(events_params)

        if @event.save
            redirect_to event_path(@event), notice: "Your event was succesfully created!"
        else 
            render 'new'
        end 
    end 

    def edit 
        @event = Event.find(params[:id])
    end 

    def update
        if @event.update(event_params)
            redirect_to event_path(@event), notice: "The event was succesfully updated."
        else 
            render "edit"
        end 
    end 

    def destroy
    end 

    private

    def events_params(*args)
        params.require(:event).permit(:title, :description, :date, :address, :start_time, :end_time)
    end  
end 