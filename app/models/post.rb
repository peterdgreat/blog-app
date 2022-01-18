class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id

  def post_update_counter
    user = User.find(author_id)
    user.update_attribute(:posts_count, user.posts_count + 1)
  end

  def most_recent_comments
    Comment.where(post_id: id).order(created_at: :desc).limit(3)
  end
end
