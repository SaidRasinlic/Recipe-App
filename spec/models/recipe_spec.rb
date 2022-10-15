# frozen_string_literal: true

require 'rails_helper'

describe Recipe, type: :model do
  subject do
    Recipe.new(name: 'Tom')
  end

  before { subject.save }

  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should belong_to :user }
    it { should have_many :recipe_foods }
    it { should have_many :foods }
  end
end
