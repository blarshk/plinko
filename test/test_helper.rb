require 'minitest/autorun'
require 'plinko'

class EndsInShk < Plinko::Validator
  def validation
    proc { |string| string.end_with?('shk') }
  end

  def error_message
    "#{value} does not end in 'shk'"
  end
end