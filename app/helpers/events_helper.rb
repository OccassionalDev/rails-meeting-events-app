module EventsHelper
    def date_of(event)
        event.date.to_date.strftime("%A, %B %e")
    end 

    def time_of(event)
        event.start_time.to_time.strftime("%l:%M %p")
    end 
end 