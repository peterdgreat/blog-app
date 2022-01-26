class RemovelikesIdfromlikes < ActiveRecord::Migration[7.0]


  def change
    remove_foreign_key :likes, :likes
  end




end
