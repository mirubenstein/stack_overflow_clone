class AnswersController < ApplicationController
  before_filter :authorize, only: [:new, :create, :edit, :update, :destroy]

  def show
    @answer = Answer.find(params[:id])
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    @answer.user_id = current_user.id
    if @answer.save
      flash[:notice] = "Your answer was added."
      redirect_to :back
    else
      render "question/#{@question.id}"
    end
  end

  private
    def answer_params
      params.require(:answer).permit(:answer)
    end
end
