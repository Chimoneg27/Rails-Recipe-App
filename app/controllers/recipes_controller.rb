class RecipesController < ApplicationController
  load_and_authorize_resource
  before_action :set_recipe, only: %i[show destroy toggle_public]
  before_action :authenticate_user!, except: [:public_recipes]

  def public_recipes
    @public_recipes = Recipe.where(public: true).includes(recipe_foods: :food).order(created_at: :desc)
  end

  def index
    @recipes = current_user.recipes
  end

  def show
    @recipe_foods = @recipe.recipe_foods
  end

  def new
    @recipe = current_user.recipes.build
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      redirect_to @recipe, notice: 'Recipe was created'
    else
      render :new
    end
  end

  def destroy
    if @recipe.user == current_user
      @recipe.recipe_foods.destroy_all
      @recipe.destroy
      respond_to do |format|
        format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      end
    else
      redirect_to recipes_url, alert: 'You are not authorized to delete this recipe.'
    end
  end

  def toggle_public
    if @recipe.user == current_user
      @recipe.update(public: !@recipe.public)
      respond_to(&:js)
    else
      redirect_to recipes_url, alert: 'You are not authorized to change this recipe.'
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end