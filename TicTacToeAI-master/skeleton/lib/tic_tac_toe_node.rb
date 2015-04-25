require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = Board.new
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)

  end

  # def []=(pos, value)
  #   x,y = pos
  #   @board[x][y]
  # end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    if @children
      @children
    else

    @children = []

    @board.each_index do |row|
      @board[row].each_index do |col|
       move = [row][col]
       new_board = @board.dup

       next unless new_board[move].nil?

       new_board[move] = next_mover_mark

       @children << TicTacToeNode.new(new_board, flip_mark(next_mover_mark), move)
      end
    end

    @children
  end
  end

  def flip_mark(mark)
    mark == :x ? :o : :x
  end

end


# game = TicTacToeNode.new(Array.new(3) { Array.new(3) }, 'x')
#
# p game.@children
