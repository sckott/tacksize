# Tacksize

This is a port of the [taxonomic toolkit I've created for the R language](https://github.com/ropensci/taxize_). R is great for scientists, etc., but doesn't work in the web really at all. Thus, the port to Ruby, which plays nice with the web. 

## Installation

Add this line to your application's Gemfile:

    gem 'tacksize'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tacksize

## Usage

Resolve a taxonomic name using the Global Names Resolver from the Encyclopedia of Life (EOL).

`Tacksize.gnr_resolve('Helianthus annuus')`

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
