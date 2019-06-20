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
  # ユーザID
  validates :user_id,
    presence: true

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

  scope :display_order_is, -> (value) { where(display_order: value) }

  scope :challenge_level_is, -> (value) { where(challenge_level: value) }

  scope :id_is_not, -> (value) { where.not(id: value) }

  ##
  # methods
  ##
  # 表示順チェック(難易度別)
  # @param  [integer] challenge_level 難易度別
  # @param  [string]  display_order 表示順
  # @return [Boolean] 重複しているか？
  def self.display_order_duplicated?(challenge_level, display_order)
    !Post.challenge_level_is(challenge_level).display_order_is(display_order).blank?
  end

  # 表示順チェック(難易度別)
  # @param  [integer] challenge_level 難易度別
  # @param  [string]  display_order 表示順
  # @return [Boolean] 重複しているか？
  def self.display_order_duplicated_for_edit?(id, challenge_level, display_order)
    !Post.id_is_not(id).challenge_level_is(challenge_level).display_order_is(display_order).blank?
  end

  # 削除済みチェック
  # @param [LeaseCompany] post 謎解き問題
  # @return [Boolean] 削除されている : true 削除されていない : false
  def self.already_deleted?(post)
    ! Post.exists?(id: post.id)
  end

end