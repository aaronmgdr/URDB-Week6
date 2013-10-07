class Movie < ActiveRecord::Base
  has_many :showtimes
  
  def snippet
    self.description.truncate 50
  end
end
