# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name       = "NAME"
  spec.version    = "1.0"
  spec.autors     = ["Víctor López"]
  spec.email      = ["haha@haha.es"]
  spec.summary    = %q{Advent of Code exercices}
  spec.description= %q{Solutions made for me}
  spec.homepage   = "http://adventofcode.com/2021"
  spec.licence    = "MIT"
  spec.files      = ['lib/NAME.rb']
  spec.executables= ['bin/NAME']
  spec.test_files = ['tests/test_NAME.rb']
  spec.require_paths = ["lib"]
end
