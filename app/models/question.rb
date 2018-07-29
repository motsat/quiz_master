class Question < ApplicationRecord
  validates :content, presence: true, length: { maximum: 300 }
  validates :right_answer, presence: true, length: { maximum: 100 }
  validates :display_order, presence: true, uniqueness: true, numericality: { only_integer: true }

  scope :remain_display_of, ->(question) do
    where("display_order > ?", question.display_order).order(display_order: :asc)
  end

  def next_question
    Question.remain_display_of(self).first
  end
end
