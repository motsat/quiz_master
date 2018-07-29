class Questions::AnswersController < ApplicationController
  def create
    question = Question.find params[:question_id]
    answer = question_params[:answer].to_s
    if Quiz::Judgementer.new(question, answer).right?
      return show_completed_or_next_question(question)
    else
      flash[:answer_wrong] = true
      return redirect_to question_path(question)
    end
  end

  private 

  def question_params
    params.require(:questions).permit(:answer)
  end

  def show_completed_or_next_question(current_question)
    next_question = current_question.next_question
    if next_question
      flash[:answer_right] = true
      redirect_to question_path(next_question)
    else
      render "completed"
    end
  end
end
