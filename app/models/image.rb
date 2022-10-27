class Image < ApplicationRecord
  has_many :image_houses
  has_many :products, through: :image_houses

  mount_uploader :image, ImageUploader
end
