class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :post

  def comment_update_counter
    post = Post.find(post_id)
    post.update_attribute(:comments_count, post.comments_count + 1)
  end
end
