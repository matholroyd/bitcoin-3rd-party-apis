class BlockchainInfo
  module BlockChain

    def getreceivedbyaddress(address, minconf = 0)
      if minconf > 0 
        url = "#{getreceivedbyaddress_url}/#{address}?confirmations=#{minconf}"
      else
        url = "#{getreceivedbyaddress_url}/#{address}"
      end
      
      satoshi_to_bitcoins BigDecimal(open(url).read)
    end

    private 
    
    def satoshi_to_bitcoins(satoshi)
      satoshi / (10 ** 8)
    end
                
    def getreceivedbyaddress_url
      "#{domain}/q/getreceivedbyaddress"
    end
    
    def get_json(url)
      JSON.parse open(url).read
    end
  end
  
  extend BlockChain
end