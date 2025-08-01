require 'models/food.rb'

class FoodFactory
  def initialize
    @id = 0
  end

  def create_food(food_text:)
    Food.new(id: next_id, name: food_name(food_text:), **food_nutrients(food_text:))
  end

  private

  def next_id
    @id += 1
  end

  def food_name(food_text:)
    food_name = food_text.slice(/[\p{Hiragana}\p{Katakana}\p{Han}0-9a-zA-Z０-９Ａ-Ｚａ-ｚー()（）]+/)
    food_name
  end

  def food_nutrients(food_text:)
    food_nutrients = food_text.scan(/(calorie|p|f|c):\s?(\d+\.?\d?)/).to_h
    food_nutrients.transform_keys!(&:to_sym)
    food_nutrients.transform_values!(&:to_f)
    food_nutrients
  end
end
