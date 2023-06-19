class Game
  def initialize
    @player1 = Player.new
    @player2 = Player.new
  end

  def game_loop
    loop do
      current_player = determine_current_player

      math_question = MathQuestion.new
      math_question.generate_question

      puts "#{current_player.name}: #{math_question.question}"
      answer = gets.chomp.to_i

      if math_question.verify_answer(answer)
        puts "#{current_player.name}: YES! You are correct."
      else
        puts "#{current_player.name}: Seriously? No!"
        current_player.decrease_lives
      end

      display_scores

      break if game_over?

      puts "NEW TURN"
      puts "-_"
    end

    determine_winner
    puts "GAME OVER"
    puts "Good bye!"
  end

  def determine_current_player
    @player1.turn ? @player1 : @player2
  end

  def display_scores
    puts "P1: #{player_score(@player1)} vs P2: #{player_score(@player2)}"
  end

  def player_score(player)
    "#{player.score}/3"
  end

  def game_over?
    @player1.lives.zero? || @player2.lives.zero?
  end

  def determine_winner
    if @player1.lives.zero?
      puts "Player 2 wins with a score of #{player_score(@player2)}"
    else
      puts "Player 1 wins with a score of #{player_score(@player1)}"
    end
  end
end