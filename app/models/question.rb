class Question < ApplicationRecord
  # 論理削除使用
  acts_as_paranoid

  ##
  # リレーション
  ##
  has_many :hits
  has_many :answers

  ##
  # バリデーション
  ##


  ##
  # scopes
  ##

end
