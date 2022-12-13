class FoodsController < ApplicationController
  def create
    @user = current_user
    @food = @user.foods.new(food_params)
    if @food.save
      redirect_to root_path, notice: 'Food was successfully created.'
    else
      render :new, alert: 'Food was not created.'
    end
  end

  def new
    @food = Food.new
  end

  def index
    @user = current_user
    @foods = @user.foods
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to root_path, notice: 'Food was successfully deleted.'
  end

  private

  def food_params
    params.permit(:name, :measurement_unit, :price, :quantity, current_user.id)
  end
end
