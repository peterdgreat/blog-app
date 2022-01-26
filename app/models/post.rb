class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :like
  after_save :post_update_counter
  def post_update_counter
    user = User.find(author_id)
    user.posts_counter += 1
    user.save
  end

  def self.most_recent_comments(post_id, author_id)
    Comment.where(post_id: post_id, author_id: author_id).order(created_at: :desc).limit(5)
  end
end
