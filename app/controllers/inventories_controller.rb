# frozen_string_literal: true

# InventoriesController
class InventoriesController < ApplicationController
  def index
    @user = current_user
    @inventories = @user.inventories unless @user.nil?
  end

  def show
    @inventory = Inventory.find_by_id(params[:id])
  end

  def destroy
    @inventory = Inventory.find_by_id(params[:id])
    @inventory.destroy
    redirect_to inventories_path
  end

  def new
    @inventory = Inventory.new
  end

  def create
    @user = current_user
    @inventory = Inventory.new(inventory_params.merge(user_id: @user.id))
    if @inventory.valid?
      @inventory.save
      redirect_to inventories_path
    else
      render :new
    end
  end

  private

  def inventory_params
    params.require(:inventory).permit(:name)
  end
end
