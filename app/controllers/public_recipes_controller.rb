class PublicRecipesController < ApplicationController
  def index
    @user = current_user
    @recipes = @user.recipes.where(public: true).order(created_at: :desc)
  end
end
