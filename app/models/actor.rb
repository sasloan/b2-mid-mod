class Actor < ApplicationRecord
	validates_presence_of :name, :age

	has_many :movie_actors
	has_many :movies, through: :movie_actors

	def self.list_alphabetically
		order(:name).pluck(:name)
	end

	def self.average_actor_age
		average(:age)
	end
end
