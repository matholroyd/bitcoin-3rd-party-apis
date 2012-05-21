require 'spec_helper'

describe BlockExplorer do
  context 'mytransactions' do
    let(:addressA) { '1JDfUiJHZ6pDY6wWYTx86RYjDCW7QxCofs' }
    let(:addressB) { '1KxepETPK2Xz8e5FaZE62y7Rww4LWuJUhG' }
    
    context 'getting transactions for one address' do
      let(:transactions) { BlockExplorer.mytransactions(addressA) }
    
      it "returns 2 transactions" do
        transactions.count.should == 2
      end
    
      it "wraps the transactions in JSON" do
        transactions.first[0].should == "6c5067ee83752022110fafefefcbbba9f006c2c90bce0d7cba4c28258831e0af"
      end
    end
    
    context 'getting transactions for 2 addresses' do
      let(:transactions) { BlockExplorer.mytransactions([addressA, addressB]) }
    
      it "returns 2 transactions" do
        transactions.count.should == BlockExplorer.mytransactions(addressA).count + BlockExplorer.mytransactions(addressB).count
      end
    end
    
  end
end
