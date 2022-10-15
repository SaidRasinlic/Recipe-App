# frozen_string_literal: true

# RecipeFoodsController
class RecipeFoodsController < ApplicationController
  def new
    @user = current_user
    @recipe = Recipe.find_by_id(params[:recipe_id])
    @available_food = @user.foods
    @recipe_food = RecipeFood.new
  end

  def create
    @recipe = Recipe.find_by_id(params[:recipe_id])
    @recipe_food = RecipeFood.new(recipe_food_params.merge(recipe_id: @recipe.id))
    if @recipe_food.valid?
      @recipe_food.save
      redirect_to recipe_path(@recipe.id)
    else
      render :new
    end
  end

  def destroy
    @recipe_food = RecipeFood.find_by_id(params[:id])
    if @recipe_food.destroy
      flash[:success] = 'Ingedient deleted.'
    else
      flash[:fail] = 'Ingedient deletion unsucessful.'
    end
    redirect_to recipes_path(params[:recipe_id]), method: :get
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end
