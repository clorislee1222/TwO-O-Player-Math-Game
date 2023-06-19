class Player
  attr_accessor :score, :lives

  def initialize
    @score = 0
    @lives = 3
  end

  def decrease_lives
    @lives -= 1
  end

  def display_score
    puts "Score: #{@score}"
  end

  def display_lives
    puts "Lives: #{@lives}"
  end
end