class Post < ApplicationRecord
  mount_uploader :image, ImageUploader

  ##
  # enum
  ##
  # 難易度
  enum challenge_level: {
    # 初級
    basic: 1,
    # 中級
    medium: 2,
    # 上級
    advance: 3,
  }

  ##
  # バリデーション
  ##
  # 画像
  validates :image,
    presence: true


end