require 'rails_helper'

describe MovieActor, type: :model do
	describe 'Relationships' do
		it {should belong_to :movie}
		it {should belong_to :actor}
	end
end
