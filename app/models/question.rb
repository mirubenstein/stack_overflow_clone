class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  validates :title, presence: true
  validates :question, presence: true

  # def answers_order
  #   final_order = []
  #   final_order << self.answers.best_answer.first
  #   order_array = self.answers.sort { |a, b| b.votes.count <=> a.votes.count}
  #   order_array.map {|answer| final_order << answer if !answer.best_answer  }
  #   final_order
  # end
end
