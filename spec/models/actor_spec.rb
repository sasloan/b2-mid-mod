require 'rails_helper'

describe Actor, type: :model do
	describe 'Validations' do
		it {should validate_presence_of :name}
		it {should validate_presence_of :age}
	end

	describe 'Relationships' do
		it {should have_many :movie_actors}
		it {should have_many(:movies).through(:movie_actors)}
	end

	describe 'Methods' do
		before :each do
			@mel = Actor.create!(name: "Mel Blanc", age: 81)
			@june = Actor.create!(name: "June Foray", age: 99)
			@lady_gaga = Actor.create!(name: "Lady Gaga", age: 33)
			@brad = Actor.create!(name: "Bradley Cooper", age: 45)
			@finn = Actor.create!(name: "Finn Wolfhard", age: 17)
			@wyatt = Actor.create!(name: "Wyatt Oleff", age: 16)
		end

		it '.list_alphabetically' do
			expect(Actor.list_alphabetically).to eq([@brad, @finn, @june, @lady_gaga, @mel, @wyatt])
		end

		it '.average_actor_age' do
			expect(Actor.average_actor_age).to eq(48.5)
		end
	end
end
