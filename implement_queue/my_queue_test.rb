require 'minitest/autorun'
require_relative 'my_queue'

class MyQueueTest < MiniTest::Test
  def setup
    @queue = MyQueue.new
  end

  def test_first
    @queue.enqueue 1
    assert_equal 1, @queue.first
  end

  def test_last
    @queue.enqueue 1
    assert_equal 1, @queue.last
  end

  def test_enqueue
    @queue.enqueue 1
    @queue.enqueue 2
    assert_equal 1, @queue.first
    assert_equal 2, @queue.last
  end

  def test_enqueue_multiple_elements
    @queue.enqueue 1, 2
    assert_equal 2, @queue.last
  end

  def test_dequeue
    @queue.enqueue 1, 2
    dequeued = @queue.dequeue
    assert_equal 1, dequeued
    assert_equal 2, @queue.last
  end

  def test_size
    @queue.enqueue 1, 2, 3
    assert_equal 3, @queue.size
  end

  def test_clear
    @queue.enqueue 1, 2, 3
    @queue.clear
    assert_equal 0, @queue.size
  end
end
