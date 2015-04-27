module Plinko
  class Validation
    attr_accessor :value, :errors

    def initialize(value, errors = [])
      self.value = value
      self.errors = errors
    end

    def with(validator)
      new_value, validation_errors = validator.validate(value)
      accumulated_errors = errors + Array(validation_errors)

      return Valid.new(new_value) if accumulated_errors.empty?

      Error.new(new_value, accumulated_errors)
    end

    class Valid < Validation
      def valid?
        true
      end
    end

    class Error < Validation
      def valid?
        false
      end
    end
  end
end