class ShowtimesController < ApplicationController
  def create
    @movie = Movie.find(params[:movie_id])
    @showtime = @movie.showtimes.new(showtime_params)


    if @showtime.save
      redirect_to @showtime.movie, notice: "Showtime was successfully created."
    else
      redirect_to @showtime.movie, alert: 'Showtime was not successfully created'
    end
  end

  private 

  def showtime_params
    params.require(:showtime).permit(:location, :time)
  end

end
