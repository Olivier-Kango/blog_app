class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  after_save :increment_posts_counter

  def increment_posts_counter
    author.increment!(:posts_counter)
  end

  def recent_comment_counter
    comment.order(created_at: :desc).limit(5)
  end
end
