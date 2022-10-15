# frozen_string_literal: true

class Food < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :measurement_unit, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  has_many :inventory_foods
  has_many :inventories, through: :inventory_foods
  has_many :recipe_foods
  has_many :recipes, through: :recipe_foods
end
