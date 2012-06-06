module BlockExplorer
  module BlockChain
    MyTransactions =        "#{BlockExplorer::Domain}/q/mytransactions"
    RawTx =                 "#{BlockExplorer::Domain}/rawtx"
    GetReceivedByAddress =  "#{BlockExplorer::Domain}/q/getreceivedbyaddress"

    def mytransactions(addresses)
      if addresses.is_a?(String)
        addresses = [addresses]
      end
      
      get_json "#{MyTransactions}/#{addresses.join('.')}"
    end

    def getreceivedbyaddress(address, minconf = 0)
      if minconf > 0 
        url = "#{GetReceivedByAddress}/#{address}/#{minconf}"
      else
        url = "#{GetReceivedByAddress}/#{address}"
      end
      
      BigDecimal(open(url).read)
    end

    # def rawtx(hash)
    #   get_json "#{RawTx}/#{hash}"
    # end
    
    private 
    
    def get_json(url)
      JSON.parse open(url).read
    end
  end
  
  extend BlockChain
end