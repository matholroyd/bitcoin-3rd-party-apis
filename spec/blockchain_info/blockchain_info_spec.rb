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
  
  context '#multiaddr' do
    context 'getting transactions for one address' do
      use_vcr_cassette

      let(:transactions) { BlockchainInfo.multiaddr(addressA)['txs'] }
      
      it "returns 2 transactions" do
        transactions.length.should == 2
      end
          
      it "wraps the transactions in JSON" do
        transactions[1]['hash'].should == "6c5067ee83752022110fafefefcbbba9f006c2c90bce0d7cba4c28258831e0af"
        transactions[1]['out'][0]['value'].should == 10000000
      end
    end
    
    context 'getting transactions for 2 addresses' do
      use_vcr_cassette

      let(:dummy) { '1abcdef' }
    
      it "returns addressA transactions" do
        BlockchainInfo.multiaddr([addressA, dummy])['txs'] == BlockchainInfo.multiaddr([addressA, dummy])['txs']
      end
    end
  end
  
end
