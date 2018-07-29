class Quiz::Judgementer
  def initialize(question, answer)
    @question = question
    @answer = answer
  end

  def right?
    nomarized_answer == nomarized_right_answer
  end

  private
  attr_accessor :question, :answer

  def is_numeric?(str)
    !!Float(str) rescue false
  end

  def nomarized_answer
    normalize(answer)
  end

  def nomarized_right_answer
    normalize(question.right_answer)
  end

  def normalize(str)
    strs = str.downcase.strip.squish.split(' ')
    normalizez = strs.map { |s| to_words(s) }
    normalizez.join(' ')
  end

  def to_words(str)
    is_numeric?(str)? NumbersInWords.in_words(to_numeric(str)) : str 
  end

  def to_numeric(str)
    float = Float(str)
    (float % 1).zero? ? float.to_i : float
  end
end
