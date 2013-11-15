require 'spec_helper'

describe BlockExplorer do
  let(:addressA) { '1JDfUiJHZ6pDY6wWYTx86RYjDCW7QxCofs' }
  let(:addressB) { '1KxepETPK2Xz8e5FaZE62y7Rww4LWuJUhG' }
  let(:addressB) { '1FfmbHfnpaZjKFvyi1okTjJJusN455paPH' }

  context '#mytransactions' do

    context 'getting transactions for one address' do
      use_vcr_cassette

      let(:transactions) { BlockExplorer.mytransactions(addressA) }

      it "returns 2 transactions" do
        transactions.count.should == 2
      end

      it "wraps the transactions in JSON" do
        transactions.first[0].should == "6c5067ee83752022110fafefefcbbba9f006c2c90bce0d7cba4c28258831e0af"
        transactions.first[1]['out'][0]['value'].should == "0.16200000"
        transactions.first[1]['out'][1]['value'].should == "0.10000000"
      end
    end

    context 'getting transactions for 2 addresses' do
      use_vcr_cassette

      let(:transactions) { BlockExplorer.mytransactions([addressA, addressB]) }

      it "returns 2 transactions" do
        transactions.count.should == BlockExplorer.mytransactions(addressA).count + BlockExplorer.mytransactions(addressB).count
      end
    end

  end

  context '#getreceivedbyaddress' do
    context "without minconf" do
      use_vcr_cassette

      it "returns the total received" do
        BlockExplorer.getreceivedbyaddress(addressA).should == BigDecimal("0.1")
      end
    end

    context "minconf" do
      use_vcr_cassette

      it "returns 0 if minconf is very high" do
        BlockExplorer.getreceivedbyaddress(addressA, 99999999).should == BigDecimal("0")
      end
    end

  end

  context '#addressbalance' do

    use_vcr_cassette

    it "returns the coin balance of the address" do
      BlockExplorer.addressbalance(addressB).should == BigDecimal("144336.40733762")
    end

  end
end
