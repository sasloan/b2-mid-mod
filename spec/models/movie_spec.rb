require 'rails_helper'

describe Movie, type: :model do
	describe 'Validations' do
		it {should validate_presence_of :name}
		it {should validate_presence_of :creation_year}
		it {should validate_presence_of :genre}
	end
end
