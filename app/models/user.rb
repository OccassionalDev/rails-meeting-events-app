class User < ActiveRecord::Base
    has_secure_password
    has_secure_password :recovery_password, validations: false

    validates_presence_of :name, :email
    validates_uniqueness_of :email

    has_many :events
    has_many :reservations
    has_many :reserved_events, through: :reservations, source: :event
    has_many :reviews

    def self.find_or_create_from_auth_hash(hash)
        find_or_create_by(email: hash[:info][:email]) do |u|
            u.name = hash[:info][:name]
            u.password = SecureRandom.hex(64)
            u.password_confirmation = u.password
        end 
    end 
end 