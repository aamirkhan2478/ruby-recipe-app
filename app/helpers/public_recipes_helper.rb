module PublicRecipesHelper
  def public_recipes
    @food = Food.where(user_id: current_user.id)
    @recipe = Recipe.where(user_id: current_user.id)
  end
end
