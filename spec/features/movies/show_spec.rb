require 'rails_helper'

describe 'As a User' do
	describe 'When I visit a Movies Show page' do
		before :each do
			@wb = Studio.create!(name: "Warner Brothers Studio")
			@bugs = @wb.movies.create!(name: "Bugs Bunny Movie", creation_year: "1940", genre: "Comedy")
			@star = @wb.movies.create!(name: "A Star Was Born", creation_year: "2018", genre: "Drama")
			@it = @wb.movies.create!(name: "IT", creation_year: "1990", genre: "Horror")
			@disney = Studio.create!(name: "Disney Studios")
			@snow = @disney.movies.create!(name: "Snow White and the Seven Dwarfs", creation_year: "1937", genre: "Classic")
			@mermaid = @disney.movies.create!(name: "The Little Mermaid", creation_year: "1989", genre: "Fantasy")
			@bb = @disney.movies.create!(name: "Beauty and the Beast", creation_year: "1991", genre: "Romance")
			@dreamworks = Studio.create!(name: "Dreamworks Studios")
			@shrek = @dreamworks.movies.create!(name: "Shrek", creation_year: "2001", genre: "Comedy")
			@trolls = @dreamworks.movies.create!(name: "Trolls", creation_year: "2016", genre: "Adventure")
			@turbo = @dreamworks.movies.create!(name: "Turbo", creation_year: "2013", genre: "Action")
			@mel = Actor.create!(name: "Mel Blanc", age: 81)
			@june = Actor.create!(name: "June Foray", age: 99)
			@lady_gaga = Actor.create!(name: "Lady Gaga", age: 33)
			@brad = Actor.create!(name: "Bradley Cooper", age: 45)
			@finn = Actor.create!(name: "Finn Wolfhard", age: 17)
			@wyatt = Actor.create!(name: "Wyatt Oleff", age: 16)

			@bugs.actors << @mel
			@bugs.actors << @june

			@star.actors << @lady_gaga
			@star.actors << @brad

			@it.actors << @finn
			@it.actors << @wyatt

			@snow.actors << @june
			@snow.actors << @lady_gaga
			@snow.actors << @wyatt
			@snow.actors << @brad

			@mermaid.actors << @finn
			@mermaid.actors << @mel

			@bb.actors << @finn
			@bb.actors << @brad
			@bb.actors << @june

			@shrek.actors << @mel
			@shrek.actors << @finn

			@trolls.actors << @lady_gaga

			@turbo.actors << @wyatt
			@turbo.actors << @mel
			@turbo.actors << @finn
			@turbo.actors << @june
		end

		it 'I see the movies name, creation year and genre' do

			visit "/movies/#{@turbo.id}"

			expect(current_path).to eq("/movies/#{@turbo.id}")

			expect(page).to have_content(@turbo.name)
			expect(page).to have_content(@turbo.creation_year)
			expect(page).to have_content(@turbo.genre)
		end

		it 'I see a list of all the actors from youngest to oldest' do

			visit "/movies/#{@turbo.id}"

			expect(current_path).to eq("/movies/#{@turbo.id}")

			expect(page).to have_content(@wyatt.name)
			expect(page).to have_content(@finn.name)
			expect(page).to have_content(@mel.name)
			expect(page).to have_content(@june.name)
		end

		it 'I see the average age of all the movies actors' do

			visit "/movies/#{@turbo.id}"

			expect(current_path).to eq("/movies/#{@turbo.id}")

			expect(page).to have_content("Average Age of Actors: 53")
		end

		it 'I see a form that allows me to add and existing actor to the list of current actors' do

			visit "/movies/#{@turbo.id}"

			expect(current_path).to eq("/movies/#{@turbo.id}")

			expect(page).to have_content("Actor's Name:")

			fill_in :actor_name, with: @lady_gaga.name

			click_on "Submit"

			expect(current_path).to eq("/movies/#{@turbo.id}")

			expect(page).to have_content(@lady_gaga.name)
		end
	end
end
