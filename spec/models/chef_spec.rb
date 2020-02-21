require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end
  describe "methods" do
    it "ingredients_used" do
      chef1 = Chef.create(name: "Chef Mike")
      dish1 = Dish.create(name: "Rails Soup", description: "Gooood", chef: chef1)
      dish2 = Dish.create(name: "Burger1", description: "Good AND secure", chef: chef1)
      ingredient1 = Ingredient.create(name: "Yam", calories: 40)
      ingredient2 = Ingredient.create(name: "Rubies", calories: 2)
      ingredient3 = Ingredient.create(name: "Fat Water", calories: 4000)
      ingredient4 = Ingredient.create(name: "Bun", calories: 120)
      ingredient5 = Ingredient.create(name: "Mystery meat", calories: 0)

      dish1.ingredients << [ingredient1, ingredient2, ingredient3]
      dish2.ingredients << [ingredient1, ingredient4, ingredient5]

      expect(chef1.ingredients_used).to eq(["Bun", "Fat Water", "Mystery meat", "Rubies", "Yam"])
    end

    it "most_popular_ingredients" do
      chef1 = Chef.create(name: "Chef Mike")
      dish1 = Dish.create(name: "Rails Soup", description: "Gooood", chef: chef1)
      dish2 = Dish.create(name: "Burger1", description: "Good AND secure", chef: chef1)
      dish3 = Dish.create(name: "Super Burger1", description: "Good AND secure", chef: chef1)
      dish4 = Dish.create(name: "Super Duper Burger1", description: "Good AND secure", chef: chef1)
      ingredient1 = Ingredient.create(name: "Yam", calories: 40)
      ingredient2 = Ingredient.create(name: "Rubies", calories: 2)
      ingredient3 = Ingredient.create(name: "Fat Water", calories: 4000)
      ingredient4 = Ingredient.create(name: "Bun", calories: 120)
      ingredient5 = Ingredient.create(name: "Mystery meat", calories: 0)

      dish1.ingredients << [ingredient1, ingredient2, ingredient3]
      dish2.ingredients << [ingredient1, ingredient4, ingredient5]
      dish3.ingredients << [ingredient1, ingredient4, ingredient5]
      dish4.ingredients << [ingredient1, ingredient4]

      expect(chef1.most_popular_ingredients).to eq(["Yam", "Bun", "Mystery meat"])
    end
  end
end
