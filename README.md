# Capistrano::Backburner 

Backburner support for Capistrano 3.x

[![Gem Version](https://badge.fury.io/rb/capistrano-backburner.svg)](https://badge.fury.io/rb/capistrano-backburner)

## Installation

Add this line to your application's Gemfile:

    gem 'capistrano-backburner'
    gem 'capistrano'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano-backburner

## Usage

Require in `Capfile` to use the default task:

```ruby
require 'capistrano/backburner'
```

You will get the following tasks

```ruby
cap backburner:start                    # Start backburner service
cap backburner:stop                     # Stop backburner service
cap backburner:restart                  # Restart backburner service
```

Configurable options (copy into deploy.rb), shown here with examples:

```ruby
# Backburner job queue or queues
# Set the --queue or --queues option to work from a particular queue.
# default value: nil
set :backburner_queues, ['default','mailer']

# Set the roles where the backburner process should be started
# default value: :app
set :backburner_roles, [:app]

# Set the location of the backburner process id file
# default value: 'File.join(shared_path, 'tmp', 'pids', 'backburner.pid')'
set :backburner_pid, 'tmp/pids/backburner.pid'

# Set the location of the backburner log file
# default value: 'File.join(shared_path, 'log', 'backburner.log')'
set :backburner_log, 'log/backburner.log'

```

It also adds the following hooks

```ruby
after 'deploy:reverted', 'backburner:stop'
after 'deploy:updated', 'backburner:stop'
after 'deploy:published', 'backburner:start'
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Credits

capistrano-backburner is maintained by [Kruger Heavy Industries](http://www.krugerheavyindustries.com)

## License

© 2017 Kruger Heavy Industries. It is free software and may be redistributed under the terms specified in the LICENSE file.

