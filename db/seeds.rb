# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
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
