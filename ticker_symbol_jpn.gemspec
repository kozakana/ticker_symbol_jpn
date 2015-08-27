# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ticker_symbol_jpn/version'

Gem::Specification.new do |spec|
  spec.name          = "ticker_symbol_jpn"
  spec.version       = TickerSymbolJpn::VERSION
  spec.authors       = ["kozakana"]
  spec.email         = ["goki727@gmail.com"]

  spec.summary       = %q{Acquire ticker symbol and company name from Japan Exchange Group.}
  spec.description   = %q{Acquire ticker symbol and company name from Japan Exchange Group.}
  spec.homepage      = "https://github.com/kozakana/ticker_symbol_jpn"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_dependency "spreadsheet"
end
