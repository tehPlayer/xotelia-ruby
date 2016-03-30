# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'version'

Gem::Specification.new do |spec|
  spec.name          = "xotelia-ruby"
  spec.version       = Xotelia::VERSION
  spec.authors       = ["Marcin Adamczyk"]
  spec.email         = ["marcin.adamczyk@subcom.me"]

  spec.summary       = %q{Xotelia Ruby Client}
  spec.description   = %q{Xotelia Ruby Client}
  spec.homepage      = "https://github.com/tehPlayer/xotelia-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", "~> 0.9"
  spec.add_dependency "json", "~> 1.8"

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry", "~> 0.9"
  spec.add_development_dependency "pry-doc", "~> 0.8"
end
