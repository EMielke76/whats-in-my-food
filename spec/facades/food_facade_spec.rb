require 'rails_helper'

RSpec.describe FoodFacade do
  context 'instance methods' do
    context '#find_food(food)' do
      it 'returns Food data', :vcr do
        query = FoodFacade.new
        results = query.find_food("sweet potatoes")

        expect(results).to be_a(Array)
        results.each do |result|
          expect(result).to be_a(Food)
        end
      end
    end
  end
end
