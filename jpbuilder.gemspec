# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.authors       = ["Jason Webb"]
  gem.email         = ["bigjasonwebb@gmail.com"]
  gem.summary       = "A small template extension to add JSONP support to Jbuilder."
  gem.version       = "0.3.0"
  gem.homepage      = "https://github.com/bigjason/jpbuilder"
  gem.files         = `git ls-files`.split("\n")
  gem.name          = "jpbuilder"
  gem.require_paths = ["lib"]
  gem.license       = "MIT"

  gem.add_dependency "jbuilder"
end
