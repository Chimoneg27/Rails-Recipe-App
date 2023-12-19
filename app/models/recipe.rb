class Recipe < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :preparation_time, numericality: { only_integer: true }
  validates :cooking_time, numericality: { only_integer: true }
  validates :description, presence: true
  has_many :recipe_foods, dependent: :destroy
end
