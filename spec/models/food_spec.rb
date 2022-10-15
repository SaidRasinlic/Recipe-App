# frozen_string_literal: true

require 'rails_helper'

describe Food, type: :model do
  describe 'Check relation of food models' do
    it { should belong_to :user }
    it { should have_many :recipe_foods }
    it { should have_many :inventory_foods }
    it { should have_many :inventories }
    it { should have_many :recipes }
  end

  describe 'field validation' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :measurement_unit }
    it { should validate_presence_of :price }
  end
end
