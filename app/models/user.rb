class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ##
  # リレーション
  ##
  has_many :posts

  ##
  # バリデーション
  ##
  validates :username, presence: true, length: { maximum: 50 }

  ##
  # scopes
  ##
  # 投稿(内部)
  scope :with_inner_posts, -> { joins(:posts).eager_load(:posts) }

  # 投稿(外部)
  scope :with_posts, -> { eager_load(:posts) }
end
