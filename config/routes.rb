Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	#studios

	get '/studios', to: 'studios#index'

	#actors

	get '/actors/:actor_id', to: 'actors#show'

	#movies
	get '/movies/:movie_id', to: 'movies#show'

	#add_actor
	post '/movies/:movie_id/actors', to: 'add_actors#new'
end
