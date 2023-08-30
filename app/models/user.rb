class User < ApplicationRecord
  has_many :authored_posts, class_name: 'Post', foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id
  has_many :liked_posts, through: :likes, source: :post
  has_many :commented_posts, through: :comments, source: :post

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def update_posts_counter
    update(posts_counter: authored_posts.count)
  end

  def posts_counter
    authored_posts.count
  end

  def recent_posts
    authored_posts.order(created_at: :desc).limit(3)
  end
end
