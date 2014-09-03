class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :votes
  has_one :best_answer
  validates :answer, presence: true

  # scope :best_answer, -> { where(best_answer: true) }

  # def make_answer_best
  #   question = self.question
  #   question.answers.each {|answer| answer.best_answer = false)}
  #   self.best_answer = true
  # end
end
