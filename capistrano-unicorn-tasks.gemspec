$:.push File.expand_path('../lib', __FILE__)

require 'capistrano/unicorn/tasks/version'

Gem::Specification.new do |s|
  s.name        = 'capistrano-unicorn-tasks'
  s.version     = Capistrano::Unicorn::Tasks::VERSION
  s.authors     = ['kami']
  s.email       = ['hiroki.zenigami@gmail.com']
  s.homepage    = 'https://github.com/kami-zh/capistrano-unicorn-tasks'
  s.summary     = 'Provides some unicorn tasks for capistrano.'
  s.description = 'Provides some unicorn tasks for capistrano.'
  s.license     = 'MIT'

  s.files = Dir['lib/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'capistrano'
end
