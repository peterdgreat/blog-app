class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :like

  after_save :post_update_counter

  private

  def post_update_counter
    user = User.find(author_id)
    user.update_attribute(:posts_count, user.posts_count + 1)
  end

  def most_recent_comments
    Comment.where(post_id: id).order(created_at: :desc).limit(5)
  end
end
