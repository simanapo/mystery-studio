class Answer < ApplicationRecord
  # 論理削除使用
  acts_as_paranoid

  ##
  # リレーション
  ##
  belongs_to :lease_company

  ##
  # バリデーション
  ##


  ##
  # scopes
  ##

end
