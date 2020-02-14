require 'rails_helper'

describe 'As a Visitor' do
	describe 'When I Visit the Studio index page.' do
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

			visit '/studios'
		end
		
		it 'I should see a list of all the staudios' do

			expect(current_path).to eq("/studios")

			expect(page).to have_content(@wb.name)
			expect(page).to have_content(@disney.name)
			expect(page).to have_content(@marvel.name)
		end

		it 'I should see all the movies for this studio underneath all the studio names' do

			expect(current_path).to eq("/studios")

			within "#studio-#{@wb.id}" do
				expect(page).to have_content(@bugs.name)
				expect(page).to have_content(@star.name)
				expect(page).to have_content(@it.name)
			end

			within "#studio-#{@disney.id}" do
				expect(page).to have_content(@snow.name)
				expect(page).to have_content(@mermaid.name)
				expect(page).to have_content(@bb.name)
			end

			within "#studio-#{@dreamworks.id}" do
				expect(page).to have_content(@shrek.name)
				expect(page).to have_content(@trolls.name)
				expect(page).to have_content(@turbo.name)
			end
		end
	end
end
