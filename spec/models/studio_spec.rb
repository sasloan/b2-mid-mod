require 'rails_helper'

describe Studio, type: :model do
	describe 'Validations' do
		it {should validate_presence_of :name}
	end

	describe 'Relationships' do
		it {should have_many :movies}
	end
end
