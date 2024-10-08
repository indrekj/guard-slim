lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "guard/slim/version"

Gem::Specification.new do |spec|
  spec.name          = "guard-slim"
  spec.version       = Guard::SlimVersion::VERSION
  spec.authors       = ["Indrek Juhkam"]
  spec.email         = ["indrek@urgas.eu"]
  spec.description   = %q{}
  spec.summary       = %q{Guard gem for slim}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "guard", ">= 2.0"
  spec.add_dependency "slim"
end
