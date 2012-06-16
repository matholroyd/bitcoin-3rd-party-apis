# -*- encoding: utf-8 -*-
require File.expand_path('../lib/bitcoin-3rd-party-apis/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Mat Holroyd"]
  gem.email         = ["matholroyd@gmail.com"]
  gem.summary       = %q{Ruby wrapper for various 3rd-party bitcoin APIs}
  gem.description   = %q{Ruby wrapper for Block Explorer and Blockchain.info. Plan to add additional 3rd-party bitcoin APIs}
  gem.homepage      = "https://github.com/matholroyd/bitcoin-3rd-party-apis"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "bitcoin-3rd-party-apis"
  gem.require_paths = ["lib"]
  gem.version       = Bitcoin3rdPartyApis::VERSION
  
  %w{rspec vcr ir_b guard-rspec webmock}.each do |gem_library|
    gem.add_development_dependency gem_library
  end
end
