require_relative 'factory/food_factory.rb'
require_relative 'models/food.rb'

RSpec.describe FoodFactory do
  let!(:food_text) { 'そば calorie: 366kcal, p: 23.5g, f: 10.7g, c:45.7g' }
  let!(:food_factory) { FoodFactory.new }

  describe '#create_food' do
    it 'Foodインスタンスが返ってくること' do
      food = food_factory.create_food(food_text:)

      expect(food).to be_an_instance_of Food
    end

    it 'Foodインスタンスの値が正しく初期化されていること' do
      food = food_factory.create_food(food_text:)

      expect(food.id).to eq 1
      expect(food.name).to eq 'そば'
      expect(food.calorie).to eq 366
      expect(food.protein).to eq 23.5
      expect(food.fat).to eq 10.7
      expect(food.carbo).to eq 45.7
    end
  end
end
