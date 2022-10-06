class Product < ApplicationRecord
  # 上傳多檔案要用複數
  mount_uploaders :images, ProductImageUploader
end
