class FixColumnPostCounter < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :integer, :posts_counter
    rename_column :posts, :commentscounter, :comments_counter
    rename_column :posts, :likescounter, :likes_counter
  end
end
