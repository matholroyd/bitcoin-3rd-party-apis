# Bitcoin 3rd-party APIs

Ruby wrapper for various popular 3rd-party bitcoin related APIs. At the moment only Block Explorer (http://blockexplorer.com) and BlockChain.info (http://blockchain.info) are wrapped. The gem exposes some handy bitcoin blockchain query methods, useful for thin bitcoin clients.

## Installation

Add this line to your application's Gemfile:

    gem 'bitcoin-3rd-party-apis'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bitcoin-3rd-party-apis

## Usage

`mytransactions` returns Ruby hash of raw transactions relating to the specified address(es).

```ruby
    BlockExplorer.mytransactions(address)
    BlockExplorer.mytransactions([address1, address2])
```

`multiaddr` is similar to BlockExplorer's `mytransactions`, but returns a more user-friendly hash.

```ruby
    BlockchainInfo.multiaddr(address)
    BlockchainInfo.multiaddr([address1, address2])
```

`getreceivedbyaddress` returns BigDecimal of the total amount of bitcoins sent to the address. Note for the `BlockchainInfo` version, `120` is the maximum confirmation number.

```ruby
    BlockExplorer.getreceivedbyaddress(address)
    BlockExplorer.getreceivedbyaddress(address, 3) # return received amount where transactions have minconf=3

    BlockchainInfo.getreceivedbyaddress(address)
    BlockchainInfo.getreceivedbyaddress(address, 3) # return received amount where transactions have minconf=3
```

`longest_block_count` returns count of the longest blockchain in the network. This blockchain is considered the **current** blockchain.


```ruby
    BlockchainInfo.longest_block_count
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
