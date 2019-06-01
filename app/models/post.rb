class Post < ApplicationRecord
  # 論理削除使用
  acts_as_paranoid

  mount_uploader :question_image, ImageUploader
  mount_uploader :answer_image, ImageUploader

  ##
  # リレーション
  ##
  has_many :hints
  accepts_nested_attributes_for :hints, allow_destroy: true

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
  # 問題画像
  validates :question_image,
    presence: true

  # 解答画像
  validates :answer_image,
    presence: true

  # タイトル
  validates :title,
    presence: true,
    length: { maximum: 300 }

  # 問題文
  validates :question_text,
    length: { maximum: 2000 }

  # 解答文
  validates :answer_text,
    length: { maximum: 2000 }

  # 解答
  validates :answer,
    presence: true,
    length: { maximum: 2000 }

  # 備考
  validates :remarks,
  length: { maximum: 2000 }

  # 難易度
  validates :challenge_level,
    presence: true

  # 表示順
  validates :display_order,
    presence: true,
    numericality: true

  ##
  # scopes
  ##
  # ヒント(内部)
  scope :with_inner_hints, -> { joins(:hints).eager_load(:hints) }

  # ヒント(外部)
  scope :with_hints, -> { eager_load(:hints) }

end