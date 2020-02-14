require 'rails_helper'

describe 'As a User' do
	describe 'When I visit the Actors Show page' do
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

		it 'I see their name and their age' do

			visit "/actors/#{@lady_gaga.id}"

			expect(current_path).to eq("/actors/#{@lady_gaga.id}")

			expect(page).to have_content(@lady_gaga.name)
			expect(page).to have_content(@lady_gaga.age)
		end

		it 'I see all of the movies they were in' do

			visit "/actors/#{@lady_gaga.id}"

			expect(current_path).to eq("/actors/#{@lady_gaga.id}")

			expect(page).to have_content(@trolls.name)
			expect(page).to have_content(@snow.name)
			expect(page).to have_content(@star.name)
		end
	end
end
