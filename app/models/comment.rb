class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post

  after_save :increment_comments_counter

  def increment_comments_counter
    posts.increment!(:comments_counter)
  end
end
