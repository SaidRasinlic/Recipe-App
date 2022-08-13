require 'rails_helper'

RSpec.describe Food, type: :model do
  before(:all) do
    @user = User.create(name: 'John Doe', email: 'john@test.com')
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      food = Food.new(name: 'Apple', measurement_unit: 'kg', price: 1, user: @user)
      expect(food).to be_valid
    end

    it 'is not valid without a name' do
      food = Food.new(measurement_unit: 'kg', price: 1, user: @user)
      expect(food).to_not be_valid
    end

    it 'is not valid without a measurement_unit' do
      food = Food.new(name: 'Apple', price: 1, user: @user)
      expect(food).to_not be_valid
    end

    it 'is not valid without a price' do
      food = Food.new(name: 'Apple', measurement_unit: 'kg', user: @user)
      expect(food).to_not be_valid
    end
  end
end
