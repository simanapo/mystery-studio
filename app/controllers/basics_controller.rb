class BasicsController < ApplicationController

  def show
    @basic = Post.all.where(challenge_level: 1, display_order: params[:display_order]).first
    if params[:incorrect]
      @incorrect = '解答が違います。'
    end

    if ! @basic.present?
      render :end
    end
  end

  def answer
    @basic = Post.all.where(challenge_level: 1, display_order: params[:display_order]).first
    if @basic.answer == permit_answer_params[:send_answer]
      render :answer
    else
      redirect_to basics_path(display_order: params[:display_order], incorrect: true)
    end

  end

  private
    def permit_answer_params
      params.require(:post).permit(:send_answer)
    end

end