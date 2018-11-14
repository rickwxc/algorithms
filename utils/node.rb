# node for link list, tree
class Node
  attr_reader :name
  attr_reader :nxt
  attr_reader :left
  attr_reader :right
  attr_writer :nxt
  attr_writer :left
  attr_writer :right

  def initialize(name, nxt = nil, left = nil, right = nil)
    @name = name
    @nxt = nxt
    @left = left
    @right = right
  end

  def self.show_linked(node)
    unless node
      print "\n"
      return
    end
    print node.name
    print ' '
    show_linked(node.nxt)
  end
end

class N < Node
end

def node?(node)
  classes = %w[String Integer Fixnum]
  return true if classes.include? node.class.name
end

def tn(name, left = nil, right = nil)
  left = N.new(left) if node? left
  right = N.new(right) if node? right
  N.new(name, nil, left, right)
end
