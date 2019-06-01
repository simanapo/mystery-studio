class PostsController < ApplicationController
  before_action :set_post, only: [:update, :destroy]

  def show
    @post = Post.new
    @posts = Post.all
    @post.hints.build
  end

  def create
    @posts = Post.all
    @post = Post.new(permit_params)

    if @post.invalid?
      render :show
    else
      @post.save!
      redirect_to action: 'show'
    end
  end

  def update
    @posts = Post.all
    @post.assign_attributes(permit_params)
    if @post.invalid?
      render :show
    else
      @post.update!(permit_params)
      redirect_to action: 'show'
    end
  end

  def destroy
    @posts = Post.all
    @post.assign_attributes(permit_params)
    if @post.invalid?
      render :show
    else
      @post.destroy!
      redirect_to action: 'show'
    end
  end

  private
    def permit_params
      params.require(:post).permit(:id, :title, :remarks, :question_text, :answer_text,
        :answer, :question_image, :answer_image, :challenge_level, :display_order,
        hints_attributes: [:id, :post_id, :hint, :_destroy])
    end

    def set_post
      @post = ::Post.find(permit_params[:id])
    end
end