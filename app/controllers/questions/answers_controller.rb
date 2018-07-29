class Questions::AnswersController < ApplicationController
  def create
    question = Question.find params[:question_id]
    answer = question_params[:answer].to_s
    unless Quiz::Judgementer.new(question, answer).right?
      flash[:answer_wrong] = true
      return redirect_to question_path(question)
    end

    next_question = question.next_question
    if next_question
      flash[:answer_right] = true
      return redirect_to question_path(next_question)
    else
      render "completed"
    end
  end

  def question_params
    params.require(:questions).permit(:answer)
  end
end
