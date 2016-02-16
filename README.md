# Capistrano Unicorn Tasks

[![Gem Version](https://badge.fury.io/rb/capistrano-unicorn-tasks.svg)](http://badge.fury.io/rb/capistrano-unicorn-tasks)

This gem provides some unicorn tasks for capistrano.
It just adds three `cap` tasks, `unicorn:start`, `unicorn:stop` and `unicorn:restart`.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'capistrano-unicorn-tasks'
```

And then execute:

```
$ bundle
```

## Usage

Add this line to your application's Capfile:

```ruby
require 'capistrano/unicorn/tasks'
```

That's it.
You will be able to use additional `cap` tasks.

If you want to restart automatically when deploy with capistrano, add this lines to your `config/deploy.rb`:

```ruby
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end

after 'deploy:publishing', 'deploy:restart'
```

## Contributing

1. Fork it ( https://github.com/kami-zh/capistrano-unicorn-tasks/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request
