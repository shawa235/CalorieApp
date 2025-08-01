# カレントディレクトリの 'app' ディレクトリをロードパスに追加
$LOAD_PATH.unshift File.expand_path('../app', __dir__)

require 'factory/food_factory.rb'
require 'factory/meal_factory.rb'
require 'domains/tracker.rb'

running = true

food_factory = FoodFactory.new
meal_factory = MealFactory.new
tracker = Tracker.new(food_factory, meal_factory)

tracker.run

# `echo #{formated_result} | pbcopy`
