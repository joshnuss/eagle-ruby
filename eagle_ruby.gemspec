# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'eagle_ruby'
  s.version     = '0.0.1'
  s.summary     = 'EagleCAD bindings for Ruby'
  s.description = 'Provides ability read and write EagleCAD Schematics, Board Layouts and Libraries'
  s.required_ruby_version = '>= 1.9.2'

  s.author            = 'Joshua Nussbaum'
  s.email             = 'joshnuss@gmail.com'

  s.files         = `git ls-files -- {lib}/*`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")

  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'nokogiri'

  s.add_development_dependency 'rspec'
end
