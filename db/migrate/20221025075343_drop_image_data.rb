class DropImageData < ActiveRecord::Migration[6.1]
  def change
    drop_table :image_data
  end
end
