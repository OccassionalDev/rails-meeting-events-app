class Event < ActiveRecord::Base
    validates_presence_of :user_id, :title, :description, :address, :time
    validate: valid_address?
    
    belongs_to :user
    has_many :reservations
    has_many :attending_users, through: :reservations, source: :users
    has_many :reviews


    def valid_address?
        errors.add(:address, "must be a valid address") if address !~ /^\d+\s[A-z]+\s[A-z]+/
    end 
end 