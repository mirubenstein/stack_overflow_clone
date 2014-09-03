class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :votes
  validates :answer, presence: true
  scope :best_answer, -> { where(best_answer: true) }
end
