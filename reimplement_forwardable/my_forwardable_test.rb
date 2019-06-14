require 'minitest/autorun'
require_relative 'my_forwardable'

class Foo
  extend MyForwadable

  attr_reader :internal
  def initialize
    @internal = []
  end

  def_delegator :@internal, :<<, :add_element
  def_delegators :@internal, :push, :clear
end

class MyForwadableTest < MiniTest::Test
  def setup
    @foo = Foo.new
  end

  def test_add_element
    @foo.add_element 1
    assert_equal [1], @foo.internal
  end

  def test_push
    @foo.push 2
    assert_equal [2], @foo.internal
  end

  def test_clear
    @foo.push 1
    @foo.clear
    assert @foo.internal.empty?
  end
end
