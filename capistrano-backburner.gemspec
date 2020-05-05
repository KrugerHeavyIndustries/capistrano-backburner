# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "capistrano-backburner"
  spec.version       = "0.1.1"
  spec.authors       = ["Chris Kruger"]
  spec.email         = ["capistrano-backburner@krugerheavyindustries.com"]
  spec.summary       = %q{Support for backburner via Capistrano 3.x}
  spec.description   = %q{Adds support controlling backburner via Capistrano 3.x}
  spec.homepage      = "https://github.com/KrugerHeavyIndustries/capistrano-backburner"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'capistrano', '~> 3.0'

  spec.add_development_dependency "rake", ">= 12.3.3"
end
