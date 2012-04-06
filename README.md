# jpbuilder

A small extension to the excellent Jbuilder library that outputs JSONP using a specified callback.

## Installation

Add this line to your application's Gemfile:

    gem 'jpbuilder'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jpbuilder

## Usage

Install in your gem file and then just create templates with the extension `.jpbuilder`.  The template will use the callback as specified in the "callback" url parameter. If none is provided then the regular JSON format will be returned.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
