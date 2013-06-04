# hash_assertions

Hash assertions: assert required keys, assert keys with values

## Installation

Add this line to your application's Gemfile:

``` ruby
gem "hash_assertions"
```

And then execute:

``` sh
$ bundle
```

Or install it yourself as:

``` sh
$ gem install hash_assertions
```

and require it:

``` ruby
require "hash_assertions"
```

## Usage

### assert_required_keys

``` ruby
require "hash_assertions/assert_required_keys"

# Raises nothing
{ foo: "bar", baz: "qux" }.assert_required_keys(:foo, :baz)

# Raises ArgumentError, "Missing required key: baz"
{ foo: "bar" }.assert_required_keys(:foo, :baz)

# Raises ArgumentError, "Missing required key: baz"
{ foo: "bar", baz: "qux" }.assert_required_keys(:foo, "baz")

# Raises ArgumentError, "Missing required key: [:foo, :baz]"
# (assert_required_keys doesn't flatten arguments!)
{ foo: "bar", baz: "qux" }.assert_required_keys([:foo, :baz])
```

### assert_keys_with_values

``` ruby
require "hash_assertions/assert_keys_with_values"

# Raises nothing
{ foo: "bar", baz: "qux" }.assert_keys_with_values(:foo, :baz)

# Raises ArgumentError, "Blank value for key: baz"
{ foo: "bar", baz: nil }.assert_keys_with_values(:foo, :baz)

# Raises ArgumentError, "Blank value for key: baz"
{ foo: "bar", baz: "" }.assert_keys_with_values(:foo, :baz)

# Raises ArgumentError, "Blank value for key: baz"
{ foo: "bar", baz: "qux" }.assert_keys_with_values(:foo, "baz")

# Raises ArgumentError, "Blank value for key: [:foo, :baz]"
# (assert_keys_with_values doesn't flatten arguments!)
{ foo: "bar", baz: "qux" }.assert_keys_with_values([:foo, :baz])
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
