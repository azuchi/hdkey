# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "hdkey"
  spec.version       = "1.1.0"
  spec.authors       = ["Shigeyuki Azuchi"]
  spec.email         = ["azuchi@haw.co.jp"]

  spec.summary       = %q{The implementation of Bitcoin hierarchical deterministic key for Ruby.}
  spec.description   = %q{The implementation of Bitcoin hierarchical deterministic key for Ruby.}
  spec.homepage      = "https://github.com/azuchi/hdkey"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "bitcoin-ruby", "~> 0.0.10"
  spec.add_runtime_dependency "ffi"
  spec.add_runtime_dependency "bech32"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
