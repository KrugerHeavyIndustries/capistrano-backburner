# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "capistrano-backburner"
  spec.version       = "0.0.9"
  spec.authors       = ["Chris Kruger"]
  spec.email         = ["capistrano-backburner@krugerheavyindustries.com"]
  spec.summary       = %q{Adds support for backburner to Capistrano 3.x}
  spec.description   = %q{Adds support for backburner to Capistrano 3.x}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'capistrano', '>= 3.0.0'

  spec.add_development_dependency "rake", "~> 10.0"
end
