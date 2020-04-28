class User < ActiveRecord::Base
    has_secure_password
    has_secure_password :recovery_password, validations: false

    validates_presence_of :name, :email
    validates_uniqueness_of :email

    has_many :events
    has_many :reservations
    has_many :reserved_events, through: :reservations, source: :event
    has_many :reviews

    def find_or_create_from_auth_hash(hash)
        oauth_user = self.find_by(uid: hash[:info][:uid])

        if oauth_user 
            oauth_user 
        else 
            pw = SecureRandom.hex(64)
            new_oauth_user =self.create(
                uid: hash[:info][:uid],
                name: hash[:info][:name],
                email: hash[:info][:email],
                password: pw,
                password_confirmation: pw 
            )

            new_oauth_user
        end 
    end 
end 