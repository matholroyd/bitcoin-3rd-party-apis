require 'spec_helper'

describe BlockchainInfo do
  let(:addressA) { '1JDfUiJHZ6pDY6wWYTx86RYjDCW7QxCofs' }
  let(:addressB) { '1KxepETPK2Xz8e5FaZE62y7Rww4LWuJUhG' }
      
  context '#getreceivedbyaddress' do
    context "without minconf" do
      use_vcr_cassette

      it "returns the total received" do
        BlockchainInfo.getreceivedbyaddress(addressA).should == BigDecimal("0.1")
      end
    end
    
    context "minconf" do
      use_vcr_cassette

      it "returns same number for old transactions" do
        BlockchainInfo.getreceivedbyaddress(addressA, 120).should == BigDecimal("0.1")
      end
    end
    
  end
end
