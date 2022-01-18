class Like < ApplicationRecord
  belongs_to :author, className: 'User'
  belongs_to :post

  after_save :like_update_counter

  private

  def like_update_counter
    post = Post.find(post_id)
    post.update_attribute(:likes_count, post.likes_count + 1)
  end
end
