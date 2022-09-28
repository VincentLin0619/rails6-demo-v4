class ChangeRolefromUser < ActiveRecord::Migration[6.1]
  def up
    change_column :posts, :content, :text, null: true
  end

  def down
    change_column :psots, :column_name, :text
  end
end
