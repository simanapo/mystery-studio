class Post::Register
  include ActiveModel::Model

  # 初期化
  # @param [Object] post 謎解き問題のオブジェクト
  def initialize(post = nil)
    @post = post
  end

  # 謎解き問題を登録する
  # @param [Hash] post 入力データ（謎解き問題モデル）
  # @return [Object] 謎解き問題のオブジェクト
  # @raise [ActiveRecord::StatementInvalid] DBアクセス時に何らかのエラー
  # @raise [DuplicatedError] 重複エラー
  def insert(post)
    ActiveRecord::Base.transaction do
      # fail DuplicatedError if Post.display_order_duplicated?(post[:challenge_level], post[:display_order])
      post.save!
      post
    end
  end

  # 謎解き問題を更新する
  # @param [Hash] post 入力データ（謎解き問題モデル）
  # @param [Hash] id 謎解き問題id
  # @option post [DateTime] :updated_at 更新日時
  # @return [Object] 謎解き問題のオブジェクト
  # @raise [ActiveRecord::StatementInvalid] DBアクセス時に何らかのエラー
  # @raise [DuplicatedError] 重複エラー
  # @raise [AlreadyUpdated] 更新されていた
  def update(post, id)
    ActiveRecord::Base.transaction do
      @post.lock!
      # fail DuplicatedError if Post.display_order_duplicated_for_edit?(id, post[:challenge_level], post[:display_order])
      fail AlreadyUpdated if ::Post.already_updated?(post[:updated_at], @post)
      @post.update! post
      @post
    end
  end

  # 謎解き問題を削除する
  # @param [Hash] post 入力データ（謎解き問題モデル）
  # @param [Hash] id 謎解き問題id
  # @option post [DateTime] :updated_at 更新日時
  # @return [Bool] 削除に成功した場合はtrue、削除に失敗した場合はfalse
  # @raise [ActiveRecord::StatementInvalid] DBアクセス時に何らかのエラー
  # @raise [AlreadyDeleted] 更新データなし（削除されていた）
  def delete(post, id)
    ActiveRecord::Base.transaction do
      @post.lock!
      fail AlreadyDeleted  if ::Post.already_deleted? @post
      @post.destroy!
      @post
    end
  end

end