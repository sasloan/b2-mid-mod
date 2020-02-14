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
end
