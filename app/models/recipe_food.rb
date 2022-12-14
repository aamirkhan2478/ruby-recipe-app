class RecipeFood < ApplicationRecord
  belongs_to :recipe, class_name: 'Recipe', foreign_key: :recipe_id, dependent: :destroy
  belongs_to :food, class_name: 'Food', foreign_key: :food_id, dependent: :destroy
end
