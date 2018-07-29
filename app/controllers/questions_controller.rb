class QuestionsController < ApplicationController
  def show
    @question = current_question
  end

private
  def current_question
    if params[:id].present?
      Question.find params[:id]
    else
      Question.order(display_order: :asc).first!
    end
  end
end
