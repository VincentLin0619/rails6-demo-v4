class Product < ApplicationRecord
  has_many :image_houses
  has_many :images, through: :image_houses
  accepts_nested_attributes_for :images, allow_destroy: true
end
