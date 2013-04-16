class BlockchainInfo
  module BlockChain

    def multiaddr(addresses)
      if addresses.is_a?(String)
        addresses = [addresses]
      end
      
      url = "#{multiaddr_url}?active=#{addresses.join('|')}"
      JSON.parse(open(URI.encode(url)).read)
    end

    def getreceivedbyaddress(address, minconf = 0)
      if minconf > 0 
        url = "#{getreceivedbyaddress_url}/#{address}?confirmations=#{minconf}"
      else
        url = "#{getreceivedbyaddress_url}/#{address}"
      end
      
      satoshi_to_bitcoins BigDecimal(open(url).read)
    end
    
    def longest_block_count
      BigDecimal(open("#{domain}/q/getblockcount").read).to_i
    end

    private 
    
    def satoshi_to_bitcoins(satoshi)
      satoshi / (10 ** 8)
    end
                
    def getreceivedbyaddress_url
      "#{domain}/q/getreceivedbyaddress"
    end
    
    def multiaddr_url
      "#{domain}/multiaddr"
    end
    
    def get_json(url)
      JSON.parse open(url).read
    end
  end
  
  extend BlockChain
end