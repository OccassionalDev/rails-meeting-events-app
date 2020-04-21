class User < ActiveRecord::Base
    has_secure_password
    has_secure_password :recovery_password, validations: false

    validates_presence_of :first_name, :last_name, :email
    validates_uniqueness_of :email

    has_many :events
    has_many :reserved_events, through: :reservations, source: :events
    has_many :reviews

    def full_name
        "#{self.first_name} #{self.last_name}"
    end 
end 