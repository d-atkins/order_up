class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def ingredients_used
    dishes
      .joins(:ingredients)
      .distinct
      .pluck("ingredients.name")
  end

  def most_popular_ingredients
     Ingredient
      .joins(:dishes)
      .group(:id)
      .order("count(dishes.id) desc")
      .limit(3)
      .pluck(:name)
  end
end
