require 'test_helper'

class TestMultiValidator < MiniTest::Test
  def test_returns_valid_object
    string = 'blarshk'
    validator = Plinko::MultiValidator.new(string, [StartsWithBlar, EndsInShk])
    result = validator.valid?
    assert_equal true, result
  end

  def test_returns_invalid_object
    string = 'blarph'
    validator = Plinko::MultiValidator.new(string, [StartsWithBlar, EndsInShk])
    result = validator.valid?
    assert_equal false, result
  end

  def test_returns_invalid_object_with_many_errors
    string = 'ohhai'
    validator = Plinko::MultiValidator.new(string, [StartsWithBlar, EndsInShk])
    result = validator.validation
    assert_equal false, result.valid?
    assert_equal ["ohhai does not start with 'blar'", "ohhai does not end in 'shk'"], result.errors
  end
end