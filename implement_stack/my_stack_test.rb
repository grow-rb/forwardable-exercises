require 'minitest/autorun'
require_relative 'my_stack'

class MyStackTest < MiniTest::Test
  def setup
    @stack = MyStack.new
  end

  def test_peek
    @stack.push 1
    assert_equal 1, @stack.peek
  end

  def test_push
    @stack.push 1
    @stack.push 2
    assert_equal 2, @stack.peek
  end

  def test_push_multiple_elements
    @stack.push 1, 2
    assert_equal 2, @stack.peek
  end

  def test_pop
    @stack.push 1, 2
    popped = @stack.pop
    assert_equal 2, popped
    assert_equal 1, @stack.peek
  end

  def test_size
    @stack.push 1, 2, 3
    assert_equal 3, @stack.size
  end

  def test_clear
    @stack.push 1, 2, 3
    @stack.clear
    assert_equal 0, @stack.size
  end
end
