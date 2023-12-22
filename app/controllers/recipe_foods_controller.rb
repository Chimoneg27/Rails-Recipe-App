class RecipeFoodsController < ApplicationController
  load_and_authorize_resource
  before_action :set_recipe_food, only: %i[show edit update destroy]

  # GET /recipe_foods or /recipe_foods.json
  def index
    @recipe = Recipe.includes(:recipe_foods).find(params[:recipe_id])
    @recipe_foods = @recipe.recipe_foods
  end

  # GET /recipe_foods/1 or /recipe_foods/1.json
  def show; end

  # GET /recipe_foods/new
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.new
    @user = current_user
    @available_foods = @user.foods
  end

  # GET /recipe_foods/1/edit
  def edit
    @recipe_food = RecipeFood.find(params[:id])
    @recipe = Recipe.find(params[:recipe_id])
  end

  # POST /recipe_foods or /recipe_foods.json
  def create
    @recipe_food = RecipeFood.new(recipe_food_params)
    @recipe_food.recipe = Recipe.find(params[:recipe_id])

    respond_to do |format|
      if @recipe_food.save
        format.html { redirect_to recipe_path(@recipe_food.recipe), notice: 'Recipe food was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipe_foods/1 or /recipe_foods/1.json
  def update
    respond_to do |format|
      if @recipe_food.update(recipe_food_params)
        format.html { redirect_to recipe_path(@recipe_food.recipe), notice: 'Recipe food was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipe_foods/1 or /recipe_foods/1.json
  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy

    respond_to do |format|
      format.html { redirect_to recipe_path(@recipe_food.recipe), notice: 'Recipe food was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe_food
    @recipe_food = RecipeFood.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :recipe_id, :food_id)
  end
end
