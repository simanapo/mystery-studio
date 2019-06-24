class QuestionsController < ApplicationController

  def show
    @post = Post.find(params[:id])
    Rails.logger.info(@post.inspect)
Rails.logger.info("--------------------post------------------------")
    if params[:incorrect]
      @incorrect = '解答が違います。'
    end

    if ! @post.present?
      render :end
    end
  end

  def answer
    @post = Post.find(params[:id])
    if @post.answer == permit_answer_params[:send_answer]
      render :answer
    else
      redirect_to questions_path(id: params[:id], incorrect: true)
    end

  end

  private
    def permit_answer_params
      params.permit(:send_answer)
    end

end