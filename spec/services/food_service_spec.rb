require 'rails_helper'

RSpec.describe FoodService do
  context 'instance methods' do
    context '#find_food(food)' do
      it 'returns food data' do
        VCR.use_cassette('find_food("sweet potatoes")') do
          query = FoodService.new
          food = query.find_food("sweet potatoes")

          expect(food).to be_a(Hash)

          expect(food).to have_key(:totalHits)
          expect(food[:totalHits]).to be_a(Integer)

          expect(food).to have_key(:foods)
          expect(food[:foods]).to be_a(Array)

          first_food = food[:foods].first

          expect(first_food).to have_key(:description)
          expect(first_food[:description]).to be_a(String)

          expect(first_food).to have_key(:gtinUpc)
          expect(first_food[:gtinUpc]).to be_a(String)

          expect(first_food).to have_key(:brandOwner)
          expect(first_food[:brandOwner]).to be_a(String)

          expect(first_food).to have_key(:ingredients)
          expect(first_food[:ingredients]).to be_a(String)
        end 
      end
    end
  end
end
