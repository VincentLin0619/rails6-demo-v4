class Product < ApplicationRecord
  # 上傳多檔案要用複數
  has_many_attached :images
  accepts_nested_attributes_for :images, allow_destroy: true
end
