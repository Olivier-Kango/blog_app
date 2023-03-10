class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts, class_name: 'Post', foreign_key: 'author_id', dependent: :destroy
  has_many :likes, foreign_key: 'author_id', dependent: :destroy
  has_many :comments, foreign_key: 'author_id', dependent: :destroy

  validates :name, presence: true
  validates :posts_counter, numericality: { greater_than_or_equal_to: 0 }

  def recent_post_counter
    posts.order(created_at: :desc).limit(3)
  end

  ROLES = %w[admin].freeze

  ROLES.each do |exact_role|
    define_method "#{exact_role}?" do
      role == exact_role
    end
  end
end
