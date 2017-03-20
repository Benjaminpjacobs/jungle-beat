require 'pry'
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

  def find(first, number_of_nodes)
    to_string(go_to_node(first), number_of_nodes)
  end

  def to_string(node=head, number=count, hold_over=[])
    collection = hold_over
    if node.next.nil? || collection.length == (number-1)
      collection << node.data
    else
      collection << node.data
      to_string(node.next, number, collection)
    end
    collection.join(' ')
  end

  def include?(node=head, value)
    if node.next.nil?
      found = (node.data == value)
    else
      found = (node.data == value)
      return found if found == true
      include?(node.next, value)
    end
  end

  def pop
    deleted = head.tail.data
    go_to_node(count-2).next = nil
    return deleted
  end

  def count(node=head, counts=1)
    return 0 if @head.nil?
    idx = counts
    return idx if node.next.nil?
    idx += 1
    count(node.next, idx)
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

  def go_to_node(position, node=head, index=0)
    idx = index
    return node if idx == position
    idx += 1
    go_to_node(position, node.next, idx)
  end
end