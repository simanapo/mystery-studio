class PostsController < ApplicationController
  before_action :set_post, only: [:update, :destroy]

  # 謎解き問題編集画面
  def show
    @post = Post.new
    @posts = Post.all
    @post.hints.build
  end

  # 謎解き問題登録
  def create
    @posts = Post.all
    @post = Post.new(permit_params)

    if @post.invalid?
      render :show
    else
      post = Post::Register.new
      post.insert(@post)
      redirect_to action: 'show'
    end
  end

  # 謎解き問題更新
  def update
    @posts = Post.all
    @post.assign_attributes(permit_params)
    if @post.invalid?
      render :show
    else
      post = Post::Register.new(Post.find(permit_params[:id])).update(permit_params, permit_params[:id])
      redirect_to action: 'show'
    end
  end

  # 謎解き問題削除
  def destroy
    @posts = Post.all
    @post.assign_attributes(permit_params)
    if @post.invalid?
      render :show
    else
      post = Post::Register.new(Post.find(permit_params[:id])).delete(permit_params, permit_params[:id])
      redirect_to action: 'show'
    end
  end

  private
    def permit_params
      params.require(:post).permit(:id, :title, :remarks, :question_text, :answer_text,
        :answer, :question_image, :answer_image, :challenge_level, :display_order, :updated_at,
        hints_attributes: [:id, :post_id, :hint, :_destroy])
    end

    def set_post
      @post = ::Post.find(permit_params[:id])
    end
end