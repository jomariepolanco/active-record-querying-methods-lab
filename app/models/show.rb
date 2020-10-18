class Show < ActiveRecord::Base
    
    def self.highest_rating
        self.maximum(:rating)
    end

    def self.most_popular_show
        self.all.find {|show| self.highest_rating == show.rating} 
    end

    def self.lowest_rating
        self.minimum(:rating)
    end

    def self.least_popular_show
        self.all.find {|show| self.lowest_rating == show.rating}
    end 

    def self.ratings_sum
        self.all.sum {|show| show.rating}
    end

    def self.popular_shows
        self.where("rating > ?", 5)
    end

    def self.shows_by_alphabetical_order
        self.order("name ASC")
    end
end