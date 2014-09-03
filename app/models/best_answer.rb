class BestAnswer < ActiveRecord::Base
  belongs_to :answer
  belongs_to :question
  validates_uniqueness_of :answer_id
  validates_uniqueness_of :question_id
end
