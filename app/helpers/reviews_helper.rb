module ReviewsHelper
    def created_on(review)
        review.created_at.strftime("%a, %B %e %l:%M %p")
    end 
end