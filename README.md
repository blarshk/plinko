# Plinko

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/plinko`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

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