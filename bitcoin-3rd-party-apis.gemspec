# -*- encoding: utf-8 -*-
require File.expand_path('../lib/bitcoin-3rd-party-apis/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Mat Holroyd"]
  gem.email         = ["matholroyd@gmail.com"]
  gem.summary       = %q{Ruby wrapper for the Block Explorer API}
  gem.description   = %q{BlockExplorer is a Ruby wrapper for the Block Explorer API. Block Explorer (http://blockexplorer.com) is a popular bitcoin blockchain explorer. }
  gem.homepage      = ""

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
