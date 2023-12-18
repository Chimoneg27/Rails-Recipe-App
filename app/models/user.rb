class User < ApplicationRecord
  validates :name, presence => true
  has_many :recipes, dependent: :destroy
  has_many :foods, dependent: :destroy
end
