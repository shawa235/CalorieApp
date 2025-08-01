require 'lib/calorie_prompt.rb'
require 'lib/calorie_display.rb'

class Tracker
  include CaloriePrompt
  include CalorieDisplay

  def initialize(food_factory, meal_factory)
    @meals = []
    @food_factory = food_factory
    @meal_factory = meal_factory
  end

  def run
    welcome_prompt
    display_new_line
    loop do
      main_menu_prompt
      selected_key = gets.chomp
      break if selected_key == 'q'

      display_new_line
      resolve_next_action(selected_key)&.call
      display_all(@meals)
    end
  end

  private

  def resolve_next_action(selected_key)
    main_menu_map = {
      '1' => method(:add),
      '2' => method(:delete),
      '3' => method(:add_registerd_foods),
    }

    unless main_menu_map[selected_key]
      invalid_input_prompt
      return nil
    end

    main_menu_map[selected_key]
  end

  def add
    @meals << create_meal
    display_new_line(num: 2)
  end

  def create_meal
    create_meal_prompt
    name = gets.chomp

    @meal_factory.create_meal(name:, foods: create_foods(name))
  end

  def create_foods(meal_name)
    display_new_line
    create_foods_prompt(meal_name)
    lines = readlines(chomp: true)

    lines.map do |line|
      @food_factory.create_food(food_text: line)
    end
  end

  def delete
    if @meals.empty?
      puts "食事が登録されていません"
      return
    end

    meal = find_meal
    delete_method = confirm_delete_method
    delete_foods(meal, delete_method)
    display_new_line
  end

  def find_meal
    find_meal_prompt
    display_meals(@meals)
    meal_id = gets.chomp.to_i

    @meals.find { |meal| meal.id == meal_id }
  end

  def confirm_delete_method
    display_new_line
    confirm_delete_method_prompt
    gets.chomp
  end

  def delete_foods(meal, delete_method)
    if delete_method == 'id'
      display_new_line
      delete_foods_prompt
      display_foods(meal)

      target_food_ids = gets.chomp.split(' ').map(&:to_i)
      meal.foods.reject! {|food| target_food_ids.include?(food.id) }
    end

    if delete_method =='all' || meal.foods.length.zero?
      @meals.delete(meal)
    end
  end

  def add_registerd_foods
  end
end
