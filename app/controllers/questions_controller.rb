class QuestionsController < ApplicationController
  before_filter :authorize, only: [:create, :new, :show, :update, :destroy]

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.new(question_params)
    if @question.save
      flash[:notice] = "#{@question.title} was added. Thanks for asking!"
      redirect_to root_path
    else
      render 'new'
    end
  end

private
    def question_params
      params.require(:question).permit(:title, :question)
    end

end
