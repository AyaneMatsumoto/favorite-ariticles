class TimelinesController < ApplicationController
  
  def index
    @my_twitter ||= MyTwitter.new
    @tweets = {}
    @my_twitter.client.search("to:justinbieber marry me", result_type: "recent").take(10).each do |tweet|
      @tweets[tweet.id]={}
      @tweets[tweet.id]["text"] = tweet.text
      @tweets[tweet.id]["created_at"] = tweet.created_at
      #画像付きだったら画像URIをとってくる。
      if tweet.media? then
        tweet.media.each do |media|
          @tweets[tweet.id]["image_url"] = media.media_uri
        end
      end
    end
  end
  
end
