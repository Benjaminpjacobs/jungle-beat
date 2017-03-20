class Node
  attr_accessor :data, :next

  def initialize(data, next_node=nil)
    @data = data
    @next = next_node
  end
  
  def tail
    if self.next.nil?
      return self
    else
      self.next.tail
    end
  end
end