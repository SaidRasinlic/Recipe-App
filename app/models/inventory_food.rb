# frozen_string_literal: true

class InventoryFood < ApplicationRecord
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
  belongs_to :inventory
  belongs_to :food
end
