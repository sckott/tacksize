# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tacksize/version'

Gem::Specification.new do |spec|
  spec.name          = "tacksize"
  spec.version       = Tacksize::VERSION
  spec.authors       = ["schamberlain"]
  spec.email         = ["myrmecocystus@gmail.com"]
  spec.description   = %q{tacksize is a Ruby gem for interacting with many taxonomic APIs in Ruby}
  spec.summary       = %q{tacksize, tack some taxonomy to the wall}
  spec.homepage      = "http://schamberlain.github.com/tacksize"
  spec.license       = "CC0"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"

  spec.add_dependency "httparty"
end
