class RemoveColumnFromProduct < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :images
  end
end
