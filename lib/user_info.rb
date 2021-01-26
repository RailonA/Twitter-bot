require 'twitter'

class UserInfo
    attr_accessor :twitter, :twitter_user

def twitter_user 
    twitter = Twitter::REST::Client.new do |config|
        # config.consumer_key        = "YOUR_CONSUMER_KEY"
        # config.consumer_secret     = "YOUR_CONSUMER_SECRET"
        # config.access_token        = "YOUR_ACCESS_TOKEN"
        # config.access_token_secret = "YOUR_ACCESS_SECRET"
        config.consumer_key        = "VL976Jq6COpnO4FhBJte6qMMO"
        config.consumer_secret     = "lUAlVNgckSdQ1DU6HSpPy4M2bipjm6UWCqozPtzD3x3wem1H4y"
        config.access_token        = "1297192003965460486-EBPDzV4STHT3UFlg8UYe2Y3JbaSsRu"
        config.access_token_secret = "UgHJi7q9htKpUxTEbvDRrd3CqNwPlU8CCX3878yI54Psw"
    end
end

end