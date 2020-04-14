class User < ActiveRecord::Base
    validates_presence_of :first_name, :last_name, :email, :password_digest
    validates_uniqueness_of :email
    
    has_secure_password
    has_many :events
    has_many :reserved_events, through: :reservations, source: "event"
end 