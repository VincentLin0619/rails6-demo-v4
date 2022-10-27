class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.string :image
      t.belongs_to :image_meta, foreign_key: true
      t.timestamps
    end
  end
end
