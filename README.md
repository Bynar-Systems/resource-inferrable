# Resource::Inferrable
![build](https://github.com/Bynar-Systems/resource-inferrable/actions/workflows/ruby.yml/badge.svg)

Generic controllers that can infer resource based on name as well as base actions.

## Usage
```ruby
# Extend provided controller which itself inherits from ActionController::API
class ApplicationController < Resource::Inferrable::APIController
end

```

refer to [controller definition](lib/resource/inferrable/api_controller.rb) for documentation on how to override methods for plugins and which methods your controller is expected to provide.


## Installation
Add this line to your application's Gemfile:

```ruby
gem 'resource-inferrable'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install resource-inferrable
```

## Testing

```bash
$ bundle e rake test
```
Make sure the DB for the dummy app at `test/dummy` is created and migrated first.

