class Review < ActiveRecord::Base
    validates_presence_of :user_id, :event_id, :rating, :content
    validate :valid_rating?

    
    belongs_to :user
    belongs_to :event

    def valid_rating?
        errors.add(:rating, "must be a rating between 1-5") if rating > 5 || rating < 1
    end 
end 