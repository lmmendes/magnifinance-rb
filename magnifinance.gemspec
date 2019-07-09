
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "magnifinance/version"

Gem::Specification.new do |spec|
  spec.name          = "magnifinance"
  spec.version       = Magnifinance::VERSION
  spec.authors       = ["Luis Mendes"]
  spec.email         = ["lmmendes@gmail.com"]

  spec.summary       = %q{MagniFinance API (SOAP) client for Ruby}
  spec.description   = %q{MagniFinance API client for integrating invoicing into online stores, updated with SAFT 1.04, issue documents according to the requirements of the tax authorit}
  spec.homepage      = "https://github.com/lmmendes/magnifinance-rb"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "savon", "~> 2.11"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency 'simplecov', '~> 0.12.0'
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry-byebug"
end
