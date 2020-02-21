require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "from the dish show page" do
    it "I see the chef, list of ingredients, and calorie count for that dish" do
      chef1 = Chef.create(name: "Chef Mike")
      dish1 = Dish.create(name: "Rails Soup", description: "Gooood", chef: chef1)
      ingredient1 = Ingredient.create(name: "Yam", calories: 40)
      ingredient2 = Ingredient.create(name: "Rubies", calories: 2)
      ingredient3 = Ingredient.create(name: "Fat Water", calories: 4000)
      dish1.ingredients << [ingredient1, ingredient2, ingredient3]

      visit(dish_path(dish1.id))

      expect(page).to have_content(chef1.name)
      expect(page).to have_content(ingredient1.name)
      expect(page).to have_content(ingredient2.name)
      expect(page).to have_content(ingredient3.name)
      expect(page).to have_content("Total calories: 4042")
    end
  end
end
