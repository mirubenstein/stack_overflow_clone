class CreateBestAnswers < ActiveRecord::Migration
  def change
    create_table :best_answers do |t|
      t.belongs_to :answer
      t.belongs_to :question
    end
  end
end
