module CaloriePrompt
  def welcome_prompt
    puts "カロリーのトラッキングを開始します。"
  end

  def main_menu_prompt
    puts "メニューから操作を選択してください:"
    puts "  1. 食事内容を手動で追加する"
    puts "  2. 食事、または食事内容を削除する"
    puts "  3. 登録済みの食事内容から選択して追加する"
    puts "  q. 終了"
  end

  def create_meal_prompt
    puts "食事の名前(朝食、昼食、間食...etc)を入力してください。"
  end

  def create_foods_prompt(meal_name)
    puts "#{meal_name}の食事内容を入力してください。(改行してctrl + D で入力確定)"
    puts '例）そば calorie: 366kcal, p: 23.5g, f: 10.7g, c:45.7g'
    puts '例）納豆 calorie: 100kcal, p: 6.5g, f: 5.7g, c:10.4g'
  end

  def find_meal_prompt
    puts "どの食事について削除を行いますか？"
  end

  def confirm_delete_method_prompt
    puts "食事内容を削除する方法を選択してください。"
    puts " all: 食事内容を全て削除します"
    puts "  id: idで指定した食事内容を削除します"
  end

  def delete_foods_prompt
    puts "削除したい食事内容のidを選択してください"
  end

  def invalid_input_prompt
    puts "無効な入力です。メニューから選択してください"
  end
end
