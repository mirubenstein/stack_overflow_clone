class RemoveColumnBestAnswerFromAnswers < ActiveRecord::Migration
  def change
    remove_column :answers, :best_answer
  end
end
