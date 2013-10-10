class Movie < ActiveRecord::Base
  has_many :showtimes
  has_many :roles
  has_many :stars, through: :roles

  validates :title, presence: true

  def rotten_finder
    RottenMovie.find(title: title, limit: 1)
  end

  def audience_rating
    rotten_finder.ratings.audience_score unless rotten_finder.empty?
  end

  def snippet
    description.to_s.truncate 50
  end

  def self.average_rating

    #get all movie scores together
    scores = self.all.collect do |movie|
      movie.audience_rating
    end

    #remove nil values

    scores = scores.compact

    #add all movie scores together

    total_sum = scores.sum

    #divide by number of movies

    scores.length > 0 ? average = total_sum / scores.length : nil
  end
end
