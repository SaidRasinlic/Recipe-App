# frozen_string_literal: true

require 'rails_helper'

describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should have_many(:inventories) }
    it { should have_many :recipes }
    it { should have_many :foods }
  end
end
