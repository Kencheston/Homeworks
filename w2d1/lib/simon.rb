class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    take_turn until @game_over
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    game_over?
    round_success_message
    @sequence_length += 1
  end

  def game_over?
    if @guess != @seq || @sequence_length > 4
      @game_over = true
    end
  end

  def show_sequence
    add_random_color
    p @seq.dup
  end

  def require_sequence
    puts "Repeat the Sequence(i.e. green,yellow ) :)"
    input = gets.chomp
    @guess = input.split(",")
  end

  def add_random_color
    @seq << COLORS.shuffle.first
  end

  def round_success_message
    puts "Well done, you have #{4 - sequence_length} rounds left"
  end

  def game_over_message
    if @guess != @seq
      puts "You Lost!"
    elsif @sequence_length > 4
      puts "You Win!"
    end
  end

  def reset_game
    @game_over = false
    @seq = []
    @sequence_length = 1
  end
end

if __FILE__ == $PROGRAM_NAME
simon = Simon.new
simon.play
end
