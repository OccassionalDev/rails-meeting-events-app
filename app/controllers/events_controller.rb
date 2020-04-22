class EventsController < ApplicationController
    
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

    def destroy
    end 

    private

    def events_params(*args)
        params.require(:event).permit(:title, :description, :date, :address, :start_time, :end_time)
    end 
end 