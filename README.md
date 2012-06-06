# BlockExplorer

Ruby wrapper for Block Explorer (http://blockexplorer.com), a popular bitcoin blockchain explorer. BlockExplorer exposes some handy bitcoin blockchain query methods. This gem exposes some of those methods for easy consumption in a Ruby project.

## Installation

Add this line to your application's Gemfile:

    gem 'block_explorer'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install block_explorer

## Usage

`mytransactions` returns Ruby hash of raw transactions relating to the specified address(es).

    BlockExplorer.mytransactions(address)
    BlockExplorer.mytransactions([address1, address2])


`getreceivedbyaddress` returns BigDecimal of the total amount of bitcoins sent to the address. 

    BlockExplorer.getreceivedbyaddress(address)
    BlockExplorer.getreceivedbyaddress(address, 3) # return received amount where transactions have minconf=3


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
