class PriorityQueue
  attr_accessor :queue

  def initialize
    @queue = []
  end

  def enqueue(val, priority)
    @queue << { val: val, priority: priority }
    sort
  end

  def dequeue
    @queue.shift
  end

  def sort
    @queue.sort! { |a, b| a[:priority] - b[:priority] }
  end
end