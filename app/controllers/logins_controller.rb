class LoginsController < ApplicationController
  def index
    @posts = Post.all
  end
end
