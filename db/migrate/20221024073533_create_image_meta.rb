class CreateImageMeta < ActiveRecord::Migration[6.1]
  def change
    create_table :image_meta do |t|
      t.belongs_to :product, foreign_key: true
      t.belongs_to :post, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.timestamps
    end
  end
end
