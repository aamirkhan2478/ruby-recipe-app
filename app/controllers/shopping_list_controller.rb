class ShoppingListController < ApplicationController
  def index
    @user = current_user
    @foods = Food.where(user_id: @user.id)
    @recipes = Recipe.where(user_id: @user.id)
    @recipe_foods = RecipeFood.where(recipe_id: @recipes.ids)
    @shopping_list = []
    @recipe_foods.each do |recipe_food|
      @shopping_list << recipe_food
    end
  end
end
