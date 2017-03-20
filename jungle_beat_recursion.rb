require_relative './lib/linked_list_recursion'

class JungleBeat
  attr_accessor :list, :valid_beats, :voice, :rate

    def initialize
    @list = LinkedList.new
    @valid_beats = ['tee', 'dee', 'deep', 'bop', 'boop', 'la', 'na']
    @voice = "Boing"
    @rate = 500
  end

  def append(data)
    successfully_added = 0
    data.split.each do |item|
      if valid_beats.include?(item)
        list.append(item) 
        successfully_added += 1
      end
    end
    p successfully_added
  end

  def count
    list.count
  end

  def reset_voice
    @voice = "Boing"
  end

  def reset_rate
    @rate = 500
  end
  def play
    return `say -r #{rate} -v #{voice} #{list.to_string}`
  end
end
