class MathQuestion
  attr_reader :question

  def generate_question
    num1 = rand(1..20)
    num2 = rand(1..20)
    @question = "What does #{num1} plus #{num2} equal?"
  end

  def verify_answer(answer)
    answer == calculate_answer
  end

  private

  def calculate_answer
    num1 + num2
  end

  def num1
    @question.split(' ')[2].to_i
  end

  def num2
    @question.split(' ')[4].to_i
  end
  
end