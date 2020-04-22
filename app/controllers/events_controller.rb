class EventsController < ApplicationController
    before_action :require_login, only: [:new, :create, :edit, :update]
    
    def index
    end 

    def show
        @event = Event.find(params[:id])
    end 

    # Creating a new event
    def new 
        @event = current_user.events.build
    end 

    def create
        @event = current_user.events.build(events_params)

        if @event.save
            redirect_to root_url, notice: "Your event was succesfully created!"
        else 
            render 'new'
        end 
    end 

    def edit 
        @event = Event.find(params[:id])
    end 

    def update
        if is_event_creator?(@event)
            @event.update(event_params)
            redirect_to root_url, notice: "The event was succesfully updated."
        else 
            redirect_to root_url, alert: "You cannot edit this event."
        end 
    end 

    def destroy
    end 

    private

    def events_params(*args)
        params.require(:event).permit(:title, :description, :date, :address, :start_time, :end_time)
    end  
end 