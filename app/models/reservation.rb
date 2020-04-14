class Reservation < ActiveRecord::Base
    validates_presence_of :event_id, :user_id
    
    belongs_to :event
end 