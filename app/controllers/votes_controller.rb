class VotesController < ApplicationController
  def new
    @vote = Vote.new
  end

  def create
    @vote = Vote.new(vote_params)
    if @vote.save
      flash[:notice] = "Vote was added."
      redirect_to :back
    else
      render 'new'
    end
  end

  private
    def vote_params
      params.require(:vote).permit(:user_id, :answer_id)
    end
end
