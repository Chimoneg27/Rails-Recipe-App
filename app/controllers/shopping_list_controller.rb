class ShoppingListController < ApplicationController
  def index
    @recipe_foods = RecipeFood.all
    @food = Food.includes(:recipe_foods).where(user_id: current_user.id)
    @total_price = 0
    displayed_names = []
    @shopping_list = []

    @recipe_foods.each do |recipe_food|
      if recipe_food.food.nil? || recipe_food.quantity.nil?
        Rails.logger.error("Nil values found in recipe_food with id #{recipe_food.id}")
      else
        unless displayed_names.include?(recipe_food.food.name)
          displayed_names << recipe_food.food.name
          @total_price += recipe_food.food.price * recipe_food.quantity
          # Add the item to shopping_list including price.
          @shopping_list << { name: recipe_food.food.name, quantity: recipe_food.quantity,
                              price: (recipe_food.food.price * recipe_food.quantity) }
        end
      end
    end

    @displayed_names = displayed_names
    # Set total cost for access in view.
    @total_cost = @total_price
  end
end
