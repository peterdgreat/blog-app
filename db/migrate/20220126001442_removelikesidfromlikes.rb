class Removelikesidfromlikes < ActiveRecord::Migration[7.0]
  def change
    remove_column :likes, :likes_id
  end
end
