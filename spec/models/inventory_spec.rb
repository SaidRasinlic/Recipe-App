# frozen_string_literal: true

require 'rails_helper'

describe Inventory, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should belong_to :user }
    it { should have_many :inventory_foods }
    it { should have_many :foods }
  end
end
