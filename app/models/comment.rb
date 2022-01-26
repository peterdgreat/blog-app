class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
after_save :comment_update_counter
  def comment_update_counter
    post = Post.find(post_id)
    post.update_attribute(:comments_counter, post.comments_counter + 1)
    post.save
  end
end
