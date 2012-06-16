require 'ir_b'
require 'vcr'

require 'bitcoin-3rd-party-apis'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock 
end

RSpec.configure do |c|
  c.extend VCR::RSpec::Macros
end
