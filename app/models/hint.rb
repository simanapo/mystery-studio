class Hint < ApplicationRecord
  # 論理削除使用
  acts_as_paranoid

  ##
  # リレーション
  ##
  belongs_to :post, optional: true

  ##
  # バリデーション
  ##
  # ヒント
  validates :hint,
    length: { maximum: 2000 }

  ##
  # scopes
  ##

end
