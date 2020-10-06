class User < ActiveRecord::Base
    has_secure_password
    has_secure_password :recovery_password, validations: false

    validates_presence_of :name, :email
    validates_uniqueness_of :email
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

    # has_one_attached :avatar

    has_many :events
    has_many :reservations
    has_many :reserved_events, through: :reservations, source: :event
    has_many :reviews

    def self.create_oauth_user(hash)
        pw = SecureRandom.hex(16)
        
        create! do |u|
            u.uid = hash[:uid]
            u.name = hash[:info][:nickname]
            u.email = hash[:info][:email]
            u.password = pw 
            u.password_confirmation = pw
        end 
    end 

    def self.find_or_create_from_auth_hash(hash)
        user = find_by(uid: hash[:uid])

        if !user 
            create_oauth_user(hash)
            user = find_by(uid: hash[:uid])
        end 

        user
    end 
end 