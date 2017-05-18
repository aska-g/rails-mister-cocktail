class Ingredient < ApplicationRecord
  has_many :cocktails, through: :doses
  has_many :doses, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
