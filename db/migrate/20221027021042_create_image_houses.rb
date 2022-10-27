class CreateImageHouses < ActiveRecord::Migration[6.1]
  def change
    create_table :image_houses do |t|
      t.references :product
      t.references :image
      t.timestamps
    end
  end
end
