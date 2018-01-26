lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "hackerearth_api/version"

Gem::Specification.new do |spec|
  spec.name          = "hackerearth_api"
  spec.version       = HackerearthApi::VERSION
  spec.authors       = ["Amandeep Singh"]
  spec.email         = ["amandeep511997@gmail.com"]

  spec.summary       = %q{Ruby library for the Hackerearth API.}
  spec.homepage      = "https://github.com/amandeep511997/hackerearth_api"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_dependency "httparty", "~> 0.15.6"
end
