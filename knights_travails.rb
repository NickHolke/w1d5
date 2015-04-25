require 'byebug'
require './00_tree_node.rb'

class KnightPathFinder

  def self.valid_moves(pos)
    new_positions = []

    eight = [
    [pos.first - 1, pos.last + 2],
    [pos.first - 2, pos.last + 1],
    [pos.first - 2, pos.last - 1],
    [pos.first - 1, pos.last - 2],
    [pos.first + 1, pos.last - 2],
    [pos.first + 2, pos.last - 1],
    [pos.first + 2, pos.last + 1],
    [pos.first + 1, pos.last + 2]
    ]

    eight.each do |new_p|
      new_x, new_y = new_p[0], new_p[-1]

      if (0 <= new_x && new_x <= 2) && (0 <= new_y && new_y <= 2)
        new_pos = [new_x, new_y]
        new_positions += new_pos
      end
    end

    new_positions
  end

  def initialize(root)
    @root = PolyTreeNode.new(root)
    @visited_positions = [@root.value]
  end

  def build_move_tree
    queue = [@root]

    until queue.empty?
      dequeue = queue.shift
      new_move_positions(dequeue.value).each do |pos|
        child = PolyTreeNode.new(pos)
        child.parent = dequeue
        queue << pos
      end
    end
  end

  def find_path(destination)
    @root.bfs(destination)
  end

  def new_move_positions(pos)
    @new_positions = []
    possibilities = KnightPathFinder.valid_moves(pos)

    possibilities.each do |pos|
      @new_positions << pos unless @visited_positions.include?(pos)
    end

    @visited_positions += @new_positions
    @new_positions
  end

end


game1 = KnightPathFinder.new([0,0])
game1.build_move_tree
p game1.find_path([2,4])
