class Questions::AnswersController < ApplicationController
  def create
    question = Question.find params[:question_id]
    answer = params[:questions][:answer].presence
    unless Quiz::Judgement.new(question, answer).right?
      flash[:answer_result] = "ng!!"
      return redirect_to question_path(question)
    end

    flash[:answer_result] = "ok!!"
    next_question = question.next_question
    if next_question
      return redirect_to question_path(next_question)
    else
      render "completed"
    end
  end
end
