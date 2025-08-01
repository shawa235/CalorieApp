require_relative 'models/food.rb'
# LOAD_PATHの設定から

RSpec.describe Food do
  let(:food) { Food.new(id: 1, name: 'そば', **{ calorie: 300, p: 20, f: 10.5, c:45.5 } ) }

  describe '#id' do
    it '初期化時に渡した値が返ってくること' do
      expect(food.id).to eq 1
    end
  end
  describe '#name' do
    it '初期化時に渡した値が返ってくること' do
      expect(food.name).to eq 'そば'
    end
  end
  describe '#calorie' do
    it '初期化時に渡した値が返ってくること' do
      expect(food.calorie).to eq 300
    end
  end

  describe '#protein' do
    it '初期化時に渡した値が返ってくること' do
      expect(food.protein).to eq 20
    end
  end

  describe '#fat' do
    it '初期化時に渡した値が返ってくること' do
      expect(food.fat).to eq 10.5
    end
  end

  describe '#carbo' do
    it '初期化時に渡した値が返ってくること' do
      expect(food.carbo).to eq 45.5
    end
  end
end
