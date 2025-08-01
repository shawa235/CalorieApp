# Calorie: 366kcal, P: 23.5g, F: 10.7g, C:45.7g

lines = readlines(chomp: true)

hash_kcal_and_pfcs = lines.map do |line|
  key_and_values = line.scan(/(\w+):\s?(\d+\.?\d?)/)
  key_and_values.to_h
end

# 計算してくれるクラスを作る(足し算 or 引き算)
result = hash_kcal_and_pfcs.inject do |result, hash|
  result.merge(hash) { |_k, self_value, other_value| self_value.to_f + other_value.to_f }
end

# formatしてくれるクラスを作る(カロリー or 体重)
formated_result = "Calorie: #{result["Calorie"]}kcal, P: #{result["P"]}g, F: #{result["F"]}g, C: #{result["C"]}g"

# クリップボードに合計結果をコピー
`echo #{formated_result} | pbcopy`

puts "\n"
puts formated_result
