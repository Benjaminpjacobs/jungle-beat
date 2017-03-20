require_relative 'node'

class LinkedList
  attr_reader :head
  
  def initialize
    @head = nil
  end

  def append(data)
    if head.nil?
      @head = Node.new(data)
      head.data   
    else
      head.tail.next = Node.new(data)
      head.tail.data
    end
  end

  def find(first, number)
    to_string(go_to_node(first), number)
  end

  def to_string(top=head, index=count)
    array = []
    index.times do
      array << top.data
      top = top.next
    end
    array.join(' ')
  end

  def include?(value)
    to_string.include?(value)
  end

  def pop
    deleted = head.tail.data
    go_to_node(count-2).next = nil
    return deleted
  end

  def count
   return 0 if head.nil? 
   counter = 1
   top = head
   until top.next.nil?
     counter += 1
     top = top.next
    end
    return counter 
  end

  def prepend(data)
    temp = Node.new(head.data, head.next)
    @head = Node.new(data, temp)
  end

  def insert(position, data)
    insert_point = go_to_node(position)
    temp = Node.new(data, insert_point.next)
    insert_point.next = temp
  end

  def go_to_node(position)
    index = 0
    top = head
    until index == position
      top = top.next
      index += 1
    end
    top
  end
end
