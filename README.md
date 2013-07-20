# Guard-Slim

[![Build Status](https://secure.travis-ci.org/indrekj/guard-slim.png?branch=master)](http://travis-ci.org/indrekj/guard-slim)
[![Code Climate](https://codeclimate.com/github/indrekj/guard-slim.png)](https://codeclimate.com/github/indrekj/guard-slim)

Watches slim files, compiles them to HTML on change.

## Installation

Add the gem to your Gemfile

    gem "guard-slim", :git => "https://github.com/indrekj/guard-slim.git"

Add guard definition to your Guardfile by running this command:

    ~ guard init slim

## Options

The following options can be passed to guard-slim:

    :input => "templates"    # Relative path to the input directory
                             # Default: templates

    :output => "public"      # Relative path to the output directory
                             # Default: public

    :all_on_start => true    # Compiles all slim files on start
                             # Default: true

    :context => ContextClass # Render the template in the given context with
                             # the locals specified as methods. See tests for
                             # examples.
                             # Default: nil

    :slim_options => {}      # Options for slim engine. e.g {:pretty => true}
                             # Default: {}

## Sample Guardfile

    guard "slim", :all_on_start => true do
      watch(%r{^templates/.+(\.slim)$})
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
