class Meal
  attr_reader :id, :name
  attr_accessor :foods

  def initialize(id:, name:, foods:)
    @id = id
    @name = name
    @foods = foods
  end

  def calorie
    foods.sum(&:calorie)
  end

  def protein
    foods.sum(&:protein)
  end

  def fat
    foods.sum(&:fat)
  end

  def carbo
    foods.sum(&:carbo)
  end

  def to_s
    "#{id}. #{name} (calorie: #{calorie}kcal, P: #{protein}g, F: #{fat}g, C: #{carbo}g)"
  end
end
