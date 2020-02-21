require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :dish_ingredients}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end
  describe "methods" do
    it "total_calorie_count" do
      chef1 = Chef.create(name: "Chef Mike")
      dish1 = Dish.create(name: "Rails Soup", description: "Gooood", chef: chef1)
      ingredient1 = Ingredient.create(name: "Yam", calories: 40)
      ingredient2 = Ingredient.create(name: "Rubies", calories: 2)
      ingredient3 = Ingredient.create(name: "Fat Water", calories: 4000)
      dish1.ingredients << [ingredient1, ingredient2, ingredient3]

      expect(dish1.total_calorie_count).to eq(4042)
    end
  end
end
