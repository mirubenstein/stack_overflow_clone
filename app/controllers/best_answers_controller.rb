class BestAnswersController < ApplicationController
  def new
    @best_answer = BestAnswer.new
  end

  def create
    @best_answer = BestAnswer.new(best_answer_params)
    if @best_answer.save
      flash[:notice] = "Best answer was added."
      redirect_to :back
    else
      render 'new'
    end
  end

  private
    def best_answer_params
      params.require(:best_answer).permit(:answer_id, :question_id)
    end
end
