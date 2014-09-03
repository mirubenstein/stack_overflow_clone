class QuestionsController < ApplicationController
  before_filter :authorize, only: [:new, :create, :edit, :update, :destroy]

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers.all
    @best_answer = BestAnswer.new
    @answer = Answer.new
    @vote = Vote.new
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

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      flash[:notice] = "#{@question.title} updated."
      redirect_to question_path(@question)
    else
      render 'edit'
    end
  end

  def destroy
    @question = Question.find(params[:id])
    if @question.destroy
      flash[:notice] = "The question was deleted."
      redirect_to root_path
    end
  end

private
    def question_params
      params.require(:question).permit(:title, :question)
    end
end
