class AnswersController < ApplicationController
  before_filter :authorize, only: [:new, :create, :edit, :update, :destroy]

  def show
    @answer = Answer.find(params[:id])
    @best_answer = BestAnswer.new
  end

  def new
    @answer = Answer.new
    @question = Question.find(params[:question_id])
    render 'new.js.erb'
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    @answer.user_id = current_user.id
    if @answer.save
      respond_to do |format|
        format.html { redirect_to :back}
        format.js
      end
      flash[:notice] = "Your answer was added."
    else
      render "question/#{@question.id}"
    end
  end

  private
    def answer_params
      params.require(:answer).permit(:answer)
    end
end
