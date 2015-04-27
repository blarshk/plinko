# Plinko

Plinko helps you cascade through several validations of a value and collect all error messages along the way,
rather than breaking on the first error, as most validation strategies tend to do.

Much credit goes to [this blog post](http://milhouseonsoftware.com/2015/02/08/composable-validations/), which we both took inspiration from, and outright stole, a good portion of the beginning code.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'plinko'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install plinko

## Usage

First, create a Validator class that inherits from `Plinko::Validator`.

```ruby
class EndsInShk < Plinko::Validator
  def validation
    value.end_with?('shk')
  end

  def error_message
    "#{value} does not end in 'shk'"
  end
end
```

Then, toss the value along with the array of validators (one in this case) into `Plinko::MultiValidator`!

```ruby
string = 'blarshk'
validator = Plinko::MultiValidator.new(string, [EndsInShk])
result = validator.validation

result.valid? # => true
result.errors # => []
result.value # => 'blarshk'
```

Want to cascade through mutliple validators and collect all errors along the way? Here's how!

```ruby
class StartsWithBlar < Plinko::Validator
  def validation
    value.start_with?('blar')
  end

  def error_message
    "#{value} does not start with 'blar'"
  end
end

string = 'ohhai'
validator = Plinko::MultiValidator.new(string, [StartsWithBlar, EndsInShk])
result = validator.validation

result.valid? # => false
result.errors # => ["ohhai does not start with 'blar'", "ohhai does not end in 'shk'"]
result.value # => 'ohhai'
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/plinko/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request