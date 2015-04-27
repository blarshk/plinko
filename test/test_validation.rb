require 'test_helper'

class TestValidation < MiniTest::Test
  def test_with_successful_validator
    validation = Plinko::Validation.new('blarshk')
    result = validation.with(EndsInShk)
    assert_equal true, result.valid?
  end

  def test_with_unsuccessful_validator
    validation = Plinko::Validation.new('blarph')
    result = validation.with(EndsInShk)
    assert_equal false, result.valid?
  end
end