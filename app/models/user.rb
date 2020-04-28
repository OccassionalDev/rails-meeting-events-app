class User < ActiveRecord::Base
    has_secure_password
    has_secure_password :recovery_password, validations: false

    validates_presence_of :name, :email
    validates_uniqueness_of :email

    has_many :events
    has_many :reservations
    has_many :reserved_events, through: :reservations, source: :event
    has_many :reviews
end 