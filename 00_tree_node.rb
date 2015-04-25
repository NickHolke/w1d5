require 'byebug'

class PolyTreeNode
  attr_reader :parent, :children, :value

  def initialize(parent = nil, children = [], value)
    @parent = parent
    @children = children
    @value = value
  end

  def add_child(child_node)
    self.children << child_node
    child_node.parent=(self)
  end

  def parent=(parent_node)
    return if parent_node == self.parent
    self.parent.children.delete(self) unless self.parent.nil?

    @parent = parent_node
    parent_node.children << self unless parent_node == nil
  end

  def remove_child(child)
    raise "not your child" unless self.children.include?(child)
    self.children.delete(child)
    child.parent=(nil)
  end

  def dfs(target_value)
    # byebug
    return self if self.value == target_value

    self.children.each do |child|
      result = child.dfs(target_value)
      return result unless result.nil?
    end

    nil
  end

  def bfs(target_value)
    nodes = []
    nodes << self

    until nodes.empty?
      current_node = nodes.shift
    # debugger
      return current_node if current_node.value == target_value

      nodes += current_node.children
    end
    nil
  end

end

#
# node1 = PolyTreeNode.new(1)
# node2 = PolyTreeNode.new(2)
# node3 = PolyTreeNode.new(3)
# node4 = PolyTreeNode.new(4)
# node5 = PolyTreeNode.new(5)
#
# node2.parent = node1
# node3.parent = node1
#
# node4.parent = node2
# node5.parent = node3
#
# p node1.bfs(5)
