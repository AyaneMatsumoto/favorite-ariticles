class MyTwitter
    attr_accessor :tag, :limit, :tweet
    
    def client
        @client ||= Twitter::REST::Client.new do |config|
            config.consumer_key = "B2zn4Fw4vs6pfiFDPSR94gFqv"
            config.consumer_secret = "z3xc31wiBsgAMJLrOxcvAPsADmyCXTeFb33s062urVHfiOl5IO"
            config.access_token = '155244769-orOFz50Gb9LHgrt5zIiK5SU0hSirGpBqvEBAVd0a'
            config.access_token_secret = '2mEkkGZ3Ag1Xky9PmkON7dcahWO8FiTiNoj2yTxmr6dGO'
        end
    end
end
