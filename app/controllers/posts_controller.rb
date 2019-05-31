class PostsController < ApplicationController
  def show
    @post = Post.new
    @posts = Post.all
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

  private
    def permit_params
      params.require(:post).permit(:title, :remarks, :name, :image)
    end
end