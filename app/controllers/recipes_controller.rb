class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe_foods = @recipe.recipe_foods
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    redirect_to @recipe, notice: 'Recipe was created' if @recipe.save
    render new
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cook_time, :description, :public, :user_id)
  end
end
