class Hint < ApplicationRecord
  # 論理削除使用
  acts_as_paranoid

  ##
  # リレーション
  ##
  belongs_to :answer

  ##
  # バリデーション
  ##


  ##
  # scopes
  ##

end
