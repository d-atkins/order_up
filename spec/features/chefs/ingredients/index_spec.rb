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

      visit(chef_ingredients_path(chef1.id))

      click_link("Ingredients used by this chef")
      expect(current_path).to eq("/chefs/#{chef1.id}/ingredients")
      expect(page).to have_content("#{ingredient1} #{ingredient2} #{ingredient3} #{ingredient4} #{ingredient5}")
      expect(page).to_not have_content("#{ingredient1} #{ingredient2} #{ingredient3} #{ingredient1}")
    end
  end
end
