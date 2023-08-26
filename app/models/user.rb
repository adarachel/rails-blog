class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id
  has_many :posts, through: :likes, foreign_key: :author_id
  has_many :posts, through: :comments, foreign_key: :author_id

  scope :three_recent_posts, ->(user) { user.posts.order('created_at desc').limit(3) }

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }
  
  def posts_counter
    posts.count
  end
end