class QuestionsController < ApplicationController
  def show
    @question = current_question
  end

private

  def question_id
    params[:id].presence || session[:question_id]
  end

  def current_question
    if question_id
      Question.find question_id
    else
      Question.order(display_order: :asc).first!
    end
  end
end
