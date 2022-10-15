# frozen_string_literal: true

class Inventory < ApplicationRecord
  belongs_to :user
  has_many :inventory_foods, dependent: :destroy
  has_many :foods, through: :inventory_foods
  validates :name, presence: true
end
