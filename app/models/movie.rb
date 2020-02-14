class Movie < ApplicationRecord
	validates_presence_of :name, :creation_year, :genre
end
