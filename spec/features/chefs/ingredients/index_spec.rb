require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "from the chef ingredients index page" do
    it "I can see a unique list of names of all the ingredients that this chef uses" do
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

      visit(chef_path(chef1.id))

      click_link("Ingredients used by this chef")
      expect(current_path).to eq(chef_ingredients_path(chef1.id))
      expect(page).to have_content("Bun, Fat Water, Mystery meat, Rubies, Yam")
    end

    it "I see the three most popular ingredients that the chef uses in their dishes" do
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

      visit(chef_ingredients_path(chef1.id))

      within("#popular") { expect(page).to have_content("#{ingredient1.name}, #{ingredient4.name}, #{ingredient5.name}") }
    end
  end
end
