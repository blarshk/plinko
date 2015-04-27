module Plinko
  class Validator
    attr_accessor :value

    def initialize(value)
      self.value = value
    end

    def self.validate(value)
      new(value).validate
    end

    def validate
      if validation
        value
      else
        [value, [error_message]]      
      end
    end

    def validation
      true
    end

    def error_message
      "An error occurred."
    end
  end
end