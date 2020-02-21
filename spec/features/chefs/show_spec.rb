require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "from the chef show page" do
    it "I see the chef's name and a link to their ingredients" do
      chef1 = Chef.create(name: "Chef Mike")
      dish1 = Dish.create(name: "Rails Soup", description: "Gooood", chef: chef1)
      ingredient1 = Ingredient.create(name: "Yam", calories: 40)
      ingredient2 = Ingredient.create(name: "Rubies", calories: 2)
      ingredient3 = Ingredient.create(name: "Fat Water", calories: 4000)
      dish1.ingredients << [ingredient1, ingredient2, ingredient3]

      visit(chef_path(chef1.id))

      expect(page).to have_content(chef1.name)
      expect(page).to have_link("Ingredients used by this chef")
    end
  end
end
