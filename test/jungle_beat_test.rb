gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/linked_list'
require_relative '../lib/node'
require_relative '../jungle_beat'

class JungleBeatTest < Minitest::Test
  def test_node_class
    node = Node.new("plop")
    assert_equal "plop", node.data
    assert_nil node.next
  end

  def test_linked_list_exists
    list = LinkedList.new
  end

  def test_linked_list_head_default
    list = LinkedList.new
    assert_nil list.head
  end

  def test_linked_list_append
    list = LinkedList.new
    assert_equal "doop", list.append("doop")
  end

  def test_linked_list_append_scond
    list = LinkedList.new
    list.append("doop")
    assert_equal "deep", list.append("deep")
  end

  def test_list_head_next_node
    list = LinkedList.new
    list.append("doop")
    assert_nil list.head.tail.next
  end
  
  def test_list_count
    list = LinkedList.new
    list.append("doop")
    assert_equal 1, list.count
  end

  def test_list_count_two
    list = LinkedList.new
    list.append("doop")
    list.append("deep")
    assert_equal 2, list.count
  end

  def test_to_string
    list = LinkedList.new
    list.append("doop")
    assert_equal "doop", list.to_string
  end
  
  def test_to_string_multiple
    list = LinkedList.new
    list.append("doop")
    list.append("deep")
    list.append("dap")
    list.append("dabba")
    list.append("doo")
    assert_equal "doop deep dap dabba doo", list.to_string
  end

  def test_prepend
    list = LinkedList.new
    list.append("doop")
    list.prepend("boop")
    assert_equal "boop", list.head.data
  end

  def test_insert
    list = LinkedList.new
    list.append("doop")
    list.append("deep")
    list.append("peep")
    list.insert(1,"this will be third")
    assert_equal "this will be third", list.head.next.next.data
  end

  def test_insert_again
    list = LinkedList.new
    list.append("doop")
    list.append("deep")
    list.append("peep")
    list.insert(0, "this will be second")
    assert_equal "this will be second", list.head.next.data
  end

  def test_find
    list = LinkedList.new
    list.append("doop")
    list.append("deep")
    list.append("dap")
    list.append("dabba")
    list.append("doo")
    assert_equal "deep dap", list.find(1, 2)
  end

  def test_include?
    list = LinkedList.new
    list.append("doop")
    list.append("deep")
    list.append("dap")
    list.append("dabba")
    list.append("doo")
    assert list.include?("dabba")
    refute list.include?("elephant")
  end

  def test_pop
    list = LinkedList.new
    list.append("doop")
    list.append("deep")
    list.append("dap")
    list.append("dabba")
    list.append("doo")
    assert_equal 5, list.count
    assert_equal "doo", list.pop
    assert_equal 4, list.count
    assert_equal "dabba", list.head.tail.data
  end

  def test_jungle_beat_exists
    jb = JungleBeat.new
  end

  def test_jungle_beat_append
    jb = JungleBeat.new
    assert_equal 3, jb.append("tee dee bop")
    assert_equal "tee dee bop", jb.list.to_string
  end

  def test_jungle_beat_count
    jb = JungleBeat.new
    jb.append("tee dee bop")
    assert_equal 3, jb.count
    jb.append("tee dee bop")
    assert_equal 6, jb.count
  end

  def test_junlge_beat_beats
    jb = JungleBeat.new
    jb.append("tee dee bop tee dee bop")
    expected = `say -r 500 -v boing "tee dee bop tee dee bop"`
    assert_equal expected, jb.play
  end

  def test_jungle_beat_validation
    jb = JungleBeat.new
    jb.append("tem dee bop")
    assert_equal 2, jb.count
  end

  def test_change_rate
    jb = JungleBeat.new
    jb.append("tee dee bop tee dee bop")
    jb.rate = 100
    expected = `say -r 100 -v Boing "tee dee bop tee dee bop"`
    assert_equal expected, jb.play
  end

  def test_reset_rate
    jb = JungleBeat.new
    jb.append("tee dee bop tee dee bop")
    jb.rate = 100
    expected = `say -r 100 -v Boing "tee dee bop tee dee bop"`
    assert_equal expected, jb.play
    jb.reset_rate
    expected = `say -r 500 -v Boing "tee dee bop tee dee bop"`
    assert_equal expected, jb.play 
  end

  def test_change_voice
    jb = JungleBeat.new
    jb.append("tee dee bop tee dee bop")
    jb.voice = "Alice"
    expected = `say -r 500 -v Alice "tee dee bop tee dee bop"`
    assert_equal expected, jb.play
  end

  def test_reset_rate
    jb = JungleBeat.new
    jb.append("tee dee bop tee dee bop")
    jb.voice = "Alice"
    expected = `say -r 500 -v Alice "tee dee bop tee dee bop"`
    assert_equal expected, jb.play
    jb.reset_voice
    expected = `say -r 500 -v Boing "tee dee bop tee dee bop"`
    assert_equal expected, jb.play 
  end
end