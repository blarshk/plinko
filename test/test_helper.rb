require 'minitest/autorun'
require 'plinko'

class EndsInShk < Plinko::Validator
  def validation
    value.end_with?('shk')
  end

  def error_message
    "#{value} does not end in 'shk'"
  end
end

class StartsWithBlar < Plinko::Validator
  def validation
    value.start_with?('blar')
  end

  def error_message
    "#{value} does not start with 'blar'"
  end
end