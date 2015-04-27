require_relative 'validation'

module Plinko
  class MultiValidator
    attr_accessor :validated_object, :validators

    def initialize(validated_object, validators = [])
      self.validated_object = validated_object
      self.validators = validators
    end

    def seed
      Validation.new(validated_object)
    end

    def errors
      validation.errors
    end

    def valid?
      validation.valid?
    end

    def validation
      validators.reduce(seed) do |memo, validator|
        memo.with(validator)
      end
    end

    def validate!
      validators.reduce(seed) do |memo, validator|
        temp_val = memo.with(validator)

        raise StandardError temp_val.errors unless temp_val.valid?

        temp_val
      end
    end
  end
end