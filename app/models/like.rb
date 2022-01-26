class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
after_save :like_update_counter
  def like_update_counter
    post = Post.find(post_id)
    post.update_attribute(:likes_counter, post.likes_counter + 1)
  end
end
