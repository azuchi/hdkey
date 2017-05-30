# Hierarchical Deterministic key derivation for Ruby
[![Build Status](https://travis-ci.org/azuchi/hdkey.svg?branch=master)](https://travis-ci.org/azuchi/hdkey) [![Gem Version](https://badge.fury.io/rb/hdkey.svg)](https://badge.fury.io/rb/hdkey) [![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE) <img src="http://segwit.co/static/public/images/logo.png" width="100">

The implementation of Bitcoin hierarchical deterministic key for Ruby.

Bitcoin hierarchical deterministic key is defined by [BIP32](https://github.com/bitcoin/bips/blob/master/bip-0032.mediawiki).

## Requirements

This gem depends on [bitcoin-ruby](https://github.com/lian/bitcoin-ruby).

This gem run with following ruby version.

* 2.1
* 2.2
* 2.3

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hdkey'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hdkey

## Usage

### generate master key

```ruby
require 'hdkey'

seed = '000102030405060708090a0b0c0d0e0f'

@master_key = Bitcoin::ExtKey.generate_master(seed.htb)
```

### derive key

```ruby
# derive `m/0H` key
key = @master_key.derive(2**31)

key.depth
>= 1

key.fingerprint
=> '5c1bd648'

key.chain_code
=> '47fdacbd0f1097043b78c63c20c34ef4ed9a111d980047ad16282c7ae6236141'

key.priv
=> 'edb2e14f9ee77d26dd93b4ecede8d16ed408ce149b6cd80b0715a2d911a0afea'

# P2PKH address
key.addr
=> '19Q2WoS5hSS6T8GjhK8KZLMgmWaq4neXrh'

# Segwit address(P2WPKH)
key.segwit_addr
=> 'bc1qtsdavj8dyw49l4gt554jg47pr60gpf48ww2ens'

key.to_base58
=> 'xprv9uHRZZhk6KAJC1avXpDAp4MDc3sQKNxDiPvvkX8Br5ngLNv1TxvUxt4cV1rGL5hj6KCesnDYUhd7oWgT11eZG7XnxHrnYeSvkzY7d2bhkJ7'

key.ext_pubkey.to_base58
=> 'xpub68Gmy5EdvgibQVfPdqkBBCHxA5htiqg55crXYuXoQRKfDBFA1WEjWgP6LHhwBZeNK1VTsfTFUHCdrfp1bgwQ9xv5ski8PX9rL2dZXvgGDnw'

# P2PKH address
key.ext_pubkey.addr
=> '19Q2WoS5hSS6T8GjhK8KZLMgmWaq4neXrh'

# Segwit address(P2WPKH)
key.ext_pubkey.segwit_addr
=> 'bc1qtsdavj8dyw49l4gt554jg47pr60gpf48ww2ens'

# derive child(m/0H/1)
child_key = key.derive(1)

# For testnet
Bitcoin.network = :testnet3

# testnet P2PKH address
key.addr
=> 'mouyorX4WTsMEEkMQt6hPFa1dWBXws2Yos'

# testnet Segwit address(P2WPKH)
key.segwit_addr
=> 'tb1qtsdavj8dyw49l4gt554jg47pr60gpf48yg32gr'
```

### import key

```ruby
# import privkey
ext_privkey = Bitcoin::ExtKey.from_base58('xprv9wTYmMFdV23N2TdNG573QoEsfRrWKQgWeibmLntzniatZvR9BmLnvSxqu53Kw1UmYPxLgboyZQaXwTCg8MSY3H2EU4pWcQDnRnrVA1xe8fs')

# import pubkey
ext_pubkey = Bitcoin::ExtPubkey.from_base58('xpub6ASuArnXKPbfEwhqN6e3mwBcDTgzisQN1wXN9BJcM47sSikHjJf3UFHKkNAWbWMiGj7Wf5uMash7SyYq527Hqck2AxYysAA7xmALppuCkwQ')
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

