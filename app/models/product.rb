class Product < ApplicationRecord
  # 上傳多檔案要用複數
  has_many_attached :images
end
