class Food < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: :user_id, dependent: :destroy
  has_many :recipe_foods, foreign_key: :food_id, dependent: :destroy
end
