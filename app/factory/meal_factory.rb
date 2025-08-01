require 'models/meal.rb'

class MealFactory
  def initialize
    @id = 0
  end

  def create_meal(name:, foods:)
    Meal.new(id: next_id, name:, foods:)
  end

  private

  def next_id
    @id += 1
  end
end
