class AddMovieRefToShowtime < ActiveRecord::Migration
  def change
    change_table :showtimes do |t|
      t.references :movie
    end
  end
end
