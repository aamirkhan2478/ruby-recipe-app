class RecipesController < ApplicationController
  load_and_authorize_resource
  def new
    @recipe = Recipe.new
  end

  def create
    @user = current_user
    @recipe = @user.recipes.new(recipes_params)
    @recipe.public = false
    if @recipe.save
      redirect_to recipes_path, notice: 'recipe was successfully created'
    else
      render :new, alert: "Couldn't create recipe for user"
    end
  end

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @user = current_user
    @recipe_foods = RecipeFood.includes(:food).where(recipe_id: @recipe.id)
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path, notice: 'Recipe was successfully deleted'
  end

  def update
    @recipe = Recipe.find(params[:id])

    if @recipe.public == true
      @recipe.update(public: false)
    else
      Recipe.find(@recipe.id).update(public: true)
    end
    redirect_to recipe_path(@recipe.id), notice: 'Public Updated'
  end

  private

  def recipes_params
    params.permit(:name, :description, :preparation_time, :cooking_time, current_user.id)
  end
end
