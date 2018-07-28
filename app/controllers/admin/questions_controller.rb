class Admin::QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to  [:admin, @question], notice: 'Question was successfully created.'
    else
      render :new
    end
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to [:admin, @question], notice: 'Question was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to admin_questions_url, notice: 'Question was successfully destroyed.'
  end

  private

  def question_params
    params.require(:question).permit(:title, :right_answer, :display_order)
  end
end
