# jpbuilder

A small extension to the excellent [jbuilder](https://github.com/rails/jbuilder)
library that outputs JSONP using a specified callback.

## Installation

Add this line to your application's Gemfile:

    gem 'jpbuilder'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jpbuilder

## Usage

Install in your gem file and then just create templates with the extension
`.jpbuilder` and use the normal Jbuilder DSL.  The template will use the
callback  as specified in the "callback" url parameter. If none is provided then
the regular JSON format will be returned.

### Setting a default callback

You can set a global callback to be used  in the absence of a callback listed in
the `params` hash, by setting the `JPbuilderHandler.default_callback` variable
in an initializer:

``` ruby
# config/initializers/jpbuilder.rb
JPbuilderHandler.default_callback = "myJsCallback"
```

To disable the auto callback simply set `JPbuilderHandler.default_callback` to
`null` or `""`.

``` ruby
# config/initializers/jpbuilder.rb
JPbuilderHandler.default_callback = nil
```

**Note**: `nil` is the default value.

## TODO

* Find a decent way to test.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
