class Quiz::Judgement
  def initialize(question, answer)
    @question = question
    @answer = answer
  end

  def right?
    false
  end
  private
  attr_accessor :question, :answer
end
