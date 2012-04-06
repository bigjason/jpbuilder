# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.authors       = ["Jason Webb"]
  gem.email         = ["bigjasonwebb@gmail.com"]
  gem.summery       = "A small template extension to add JSONP support to Jbuilder."
  gem.version       = "0.1.0"
  gem.homepage      = ""
  gem.files = Dir["#{File.dirname(__FILE__)}/**/*"]
  gem.name          = "jpbuilder"
  gem.require_paths = ["lib"]

  gem.add_dependency "jbuilder"
end
