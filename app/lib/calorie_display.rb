module CalorieDisplay
  def display_all(meals)
    puts "【現在の食事と食事内容】"
    if meals.empty?
      puts "なし"
      display_new_line
      return
    else
      meals.each do |meal|
        puts meal.to_s
        puts "\s#{meal.foods.map(&:to_s).join("\n\s")}"
        display_new_line
      end
    end
  end

  def display_meals(meals)
    puts "【現在の食事一覧】"
    meals.each do |meal|
      puts meal.to_s
    end
  end

  def display_foods(meal)
    puts "【#{meal.name}の食事内容一覧】"
    meal.foods.each do |food|
      puts food.to_s
    end
  end

  def display_new_line(num: 1)
    puts "\n" * num
  end
end
