require 'test_helper'

class TestValidator < MiniTest::Test
  def test_returns_valid_object
    result = EndsInShk.validate('blarshk')
    assert_equal 'blarshk', result
  end

  def test_returns_failure_duple
    result = EndsInShk.validate('blarph')
    assert_equal ['blarph', ["blarph does not end in 'shk'"]], result
  end
end