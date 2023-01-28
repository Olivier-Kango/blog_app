class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :increment_likes_counter

  def increment_likes_counter
    post.update(likes_counter: post.likes.count)
  end
end
