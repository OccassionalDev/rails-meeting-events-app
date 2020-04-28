class Event < ActiveRecord::Base
    validates_presence_of :user_id, :title, :description, :address, :start_time, :end_time, :date
    validate :valid_address?
    validate :date_of_event_cannot_be_in_past, on: :create
    
    belongs_to :user
    has_many :reservations
    has_many :attending_users, through: :reservations, source: :user
    has_many :reviews

    def valid_address?
        errors.add(:address, "must be a valid address") if address !~ /^\d+\s[A-z]+\s[A-z]+/
    end 

    def date_of_event_cannot_be_in_past
        errors.add(:date, "must not be a past date") if date.to_date < Date.today
    end 

    def self.search(query)
        if !query.empty?
            self.where("TITLE LIKE ?", "%#{query}%")
        else 
            self.all
        end 
    end 
end 