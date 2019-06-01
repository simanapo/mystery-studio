class BasicsController < ApplicationController

  def show
    @basic = Post.all.where(challenge_level: 1, display_order: params[:display_order]).first
    if ! @basic.present?
      render :end
    end
  end

  def answer
    
  end

end