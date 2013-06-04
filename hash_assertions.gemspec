# encoding: utf-8

lib = File.expand_path("../lib", __FILE__)

$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "hash_assertions/version"

Gem::Specification.new do |spec|
  spec.name          = "hash_assertions"
  spec.version       = HashAssertions::VERSION
  spec.authors       = ["Tomek Wałkuski"]
  spec.email         = ["ja@jestem.tw"]
  spec.description   = %q{Hash assertions}
  spec.summary       = %q{Hash assertions: assert required keys, assert keys with values}
  spec.homepage      = "https://github.com/tomekw/hash_assertions"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^spec/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
