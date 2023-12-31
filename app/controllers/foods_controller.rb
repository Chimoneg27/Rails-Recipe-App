class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def show; end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    @food.user = current_user
    if @food.save
      redirect_to foods_path
    else
      render :new
    end
  end

  def destroy
    @food = Food.find(params[:id])

    @food.recipe_foods.destroy_all if @food.respond_to?(:recipe_foods) && @food.recipe_foods.present?

    @food.destroy
    redirect_to foods_path
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :quantity, :price, :user_id)
  end
end
