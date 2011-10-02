version = '0.1.beta'

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'rubype'
  s.version     = version
  s.summary     = 'Ruby Buscape API Wrapper'
  s.description = 'Ruby Buscape API Wrapper'

  s.required_ruby_version     = '>= 1.8.7'
  s.required_rubygems_version = ">= 1.3.6"

  s.author            = 'Fernando Ultremare'
  s.email             = 'feroult@gmail.com'
  s.homepage          = ''

  s.bindir             = 'bin'
  s.executables        = []

  s.add_dependency('rest-client',  '>= 1.6.7')
end
