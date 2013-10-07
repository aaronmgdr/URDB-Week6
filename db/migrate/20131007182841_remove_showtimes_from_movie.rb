class RemoveShowtimesFromMovie < ActiveRecord::Migration
  def change
    remove_column :movies, :showtimes, :string
  end
end
