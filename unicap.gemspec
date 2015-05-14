$:.unshift File.expand_path('../lib', __FILE__)

require 'unicap/version'

Gem::Specification.new do |s|
  s.name        = 'unicap'
  s.version     = Unicap::VERSION
  s.authors     = 'kami'
  s.email       = 'kami30k@gmail.com'
  s.homepage    = 'https://github.com/kami30k/unicap'
  s.summary     = 'Capistrano tasks for unicorn with Rails application.'
  s.description = 'Capistrano tasks for unicorn with Rails application.'
  s.license     = 'MIT'

  s.files = `git ls-files -z`.split("\x0")

  s.add_dependency 'capistrano'
  s.add_dependency 'rake'
end
