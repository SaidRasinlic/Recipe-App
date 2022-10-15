# frozen_string_literal: true

# Food controller
class FoodsController < ApplicationController
  def new
    @food = Food.new
  end

  def index
    @user = current_user
    if @user.nil?
      redirect_to user_session_path, flash: { alert: 'You must be signed in to continue.' }
    else
      @foods = @user.foods
    end
  end

  def show; end

  def create
    @user = current_user
    @food = Food.new(food_params)
    @food.user = @user
    if @food.save
      redirect_to foods_path, flash: { success: 'Food created successfully.' }
    else
      render :new, flash: { danger: @food.errors.messages }
    end
  end

  def edit; end

  def destroy
    @food = Food.find(params[:id])
    if check_for_associations(@food)
      @food.destroy
      flash.now[:success] = 'Food deleted successfully.'
    end
    redirect_to foods_path
  end

  private

  def check_for_associations(food)
    if food.recipes.count.positive? || food.inventories.count.positive?
      flash[:fail] = "Can't delete food in use"
      false
    else
      true
    end
  end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
