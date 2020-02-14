class AddActorsController < ApplicationController

	def new
		movie = Movie.find(params[:movie_id])
		actor = Actor.find_by(params[:name])

		movie.actors << actor
		binding.pry 

		redirect_to "/movies/#{movie.id}"
	end
end
