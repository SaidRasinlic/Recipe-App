# frozen_string_literal: true

module FeaturesHelper
  def self.create_and_activate_user(name)
    user = User.create!(
      name:, email: "#{name}@gmail.com", password: '123456'
    )
    user.save
    user
  end

  def self.create_recipes_for_user(name, count: 1)
    recipes = []
    count.times do |_i|
      recipes << Recipe.create!(name:, preparation_time: 5, cooking_time: 10,
                                public: true,
                                user_id: name.id)
    end
    recipes
  end
end
