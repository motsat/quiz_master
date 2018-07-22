class Question < ApplicationRecord
  validates :title, presence: true, length: { maximum: 300 }
  validates :right_answer, presence: true, length: { maximum: 100 }
  validates :display_order, presence: true, uniqueness: true

  def next_question
    Question.where("display_order > ?", display_order).order(display_order: :desc).first
  end
end
