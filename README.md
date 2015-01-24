# Unicap

[![Gem Version](https://badge.fury.io/rb/unicap.svg)](http://badge.fury.io/rb/unicap)

Unicap is capistrano tasks for unicorn with Rails application.
It just adds three `cap` tasks, `unicorn:start`, `unicorn:stop` and `unicorn:restart`.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'unicap'
```

And then execute:

```
$ bundle
```

## Usage

Add this line to your application's Capfile:

```ruby
require 'unicap'
```

That's it.
You will be able to use additional `cap` tasks.

If you want to restart automatically when deploy with capistrano, add this lines to your `config/deploy.rb`:

```ruby
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end

  after :publishing, :restart
end
```

## Contributing

1. Fork it ( https://github.com/kami30k/unicap/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request
