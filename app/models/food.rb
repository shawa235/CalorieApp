class Food
  attr_reader :id, :name, :calorie, :protein, :fat, :carbo

  def initialize(id:, name:, calorie:, p:, f:, c:)
    @id = id
    @name = name
    @calorie = calorie
    @protein = p
    @fat = f
    @carbo = c
  end

  def to_s
    "#{id}. #{name} calorie: #{calorie}kcal, P: #{protein}g, F: #{fat}g, C: #{carbo}g"
  end
end
