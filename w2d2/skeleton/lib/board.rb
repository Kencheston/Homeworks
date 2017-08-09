require "byebug"
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14){Array.new(4, :stone)}.map!.with_index { |stone, idx|
      idx == 6 || idx == 13 ? stone = [] : stone }
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos > 14 || start_pos < 1
  end

  def make_move(start_pos, current_player_name)
    # debugger

    opponent = current_player_name == @name1 ? @name2 : @name1
    stones = @cups[start_pos].dup
    @cups[start_pos] = []
    idx = start_pos + 1

    until stones.empty?
      idx -= 14 if idx > 13
      if opponent == @name2 && idx != 13
        @cups[idx] << stones.shift
      elsif opponent == @name1 && idx != 6
        @cups[idx] << stones.shift
      end
      idx += 1 unless stones.empty?
    end
    @cups
    render
    next_turn(idx)

    return :prompt if idx == player_goal(current_player_name)
    :switch
    idx
    @cups
    # if idx == @cup[idx].empty?
    # return @cup
    # return idx if @cup[idx].length > 1

  end

  def player_goal(player)
    if player == @name2
      return 13
    else return 6
    end
  end
  #
  # @cups[idx].length == 1
  #   stones = @cups[idx] if stones.empty?

  def next_turn(ending_cup_idx)

  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end
