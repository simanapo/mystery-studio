class UsersController < ApplicationController

  def index
    @users = User.all.with_posts
  end

  def show
    @user = User.find(params[:id])
  end

end