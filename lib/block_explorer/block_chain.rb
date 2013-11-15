class BlockExplorer

  module BlockChain

    def mytransactions(addresses)
      if addresses.is_a?(String)
        addresses = [addresses]
      end

      get_json "#{mytransactions_url}/#{addresses.join('.')}"
    end

    def getreceivedbyaddress(address, minconf = 0)
      if minconf > 0
        url = "#{getreceivedbyaddress_url}/#{address}/#{minconf}"
      else
        url = "#{getreceivedbyaddress_url}/#{address}"
      end

      BigDecimal(open(url).read)
    end

    def addressbalance(address)
      BigDecimal(open("#{addressbalance_url}/#{address}").read)
    end

    # def rawtx(hash)
    #   get_json "#{RawTx}/#{hash}"
    # end

    private

    def addressbalance_url
      "#{domain}/q/addressbalance"
    end

    def mytransactions_url
      "#{domain}/q/mytransactions"
    end

    def rawtx_url
      "#{domain}/rawtx"
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
