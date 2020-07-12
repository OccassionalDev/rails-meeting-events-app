class EventsController < ApplicationController
    before_action :require_login, only: [:new, :create, :edit, :update, :reserve]
    before_action :find_event, only: [:show, :edit, :update, :destroy, :reserve]

    def index
        @search_name = params[:query]
        @events = Event.search(params[:query])
    end 

    def show
        if logged_in?
             @reservation = Reservation.find_by(event_id: @event.id, user_id: current_user.id)
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

    # Editing an event
    def edit 
        if !is_event_creator?(@event)
            redirect_to event_path(@event), alert: "You cannot edit this event."
        end 
    end 

    def update
        if @event.update(events_params)
            redirect_to event_path(@event), notice: "The event was successfully updated."
        else 
            render "edit"
        end 
    end 

    # Destroy
    def destroy
        @event.destroy 
        redirect_to users_dashboard_path, notice: "Your event has been deleted successfully"
    end 

    # Reserve an event
    def reserve 
        if @event.nil?
            redirect_to root_url, alert: "Event cannot be reserved to, as it no longer exists."

        elsif !can_event_be_reserved?(@event)
            redirect_to event_path(@event), notice: "This event cannot be reserved, as the date for it already past."
            
        else 
            current_user.reserved_events << @event
            redirect_to root_url, notice: "You have been successfully reserved to #{@event.title}."
        end 
    end 

    private

    def events_params(*args)
        params.require(:event).permit(:title, :description, :date, :address, :start_time, :end_time, :country, :state, :city, :zip_code)
    end  

    def find_event
        @event = Event.find(params[:id])
    end 
end 