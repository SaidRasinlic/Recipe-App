# frozen_string_literal: true

# InventoryFoodsController
class InventoryFoodsController < ApplicationController
  def new
    @user = current_user
    @inventory = Inventory.find_by_id(params[:inventory_id])
    @available_food = @user.foods
    @inventory_food = InventoryFood.new
  end

  def create
    @inventory = Inventory.find_by_id(params[:inventory_id])
    @inventory_food = InventoryFood.new(inventory_food_params.merge(inventory_id: @inventory.id))
    if @inventory_food.valid?
      @inventory_food.save
      redirect_to inventory_path(@inventory.id), flash: { notice: 'Food created successfully.' }
    else
      render :new
    end
  end

  def destroy
    @inventory_food = InventoryFood.find_by_id(params[:id])
    @inventory_food.destroy
    redirect_to inventory_path(params[:inventory_id]), flash: { notice: 'Item deleted.' }
  end

  private

  def inventory_food_params
    params.require(:inventory_food).permit(:quantity, :food_id)
  end
end
