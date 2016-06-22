class TimelinesController < ApplicationController
  
  def index
    #twitterのデータ
    @my_twitter ||= MyTwitter.new
    @articles = Array.new(11){ Array.new(3) }
    i = 0
    @my_twitter.client.search("fashion", result_type: "recent").take(10).each do |tweet|
      #@articles[0].push[tweet.id,tweet.text,tweet.created_at]
      #画像付きだったら画像URIをとってくる。
      if tweet.media? then
        tweet.media.each do |media|
          @articles[i] = [tweet.id,tweet.text,media.media_uri,tweet.created_at]
        end
      else
        @articles[i] = [tweet.id,tweet.text,"",tweet.created_at]
      end
      i=i+1
    end
    
    #flicklrのデータ取得
    FlickRaw.api_key = 'ca40a058e5ceb04e8b41514d758350b3'
    FlickRaw.shared_secret = 'd1ad76b69c599de5'
    word = "fashion"
    flickr_data = flickr.photos.search(tags: word,tag_mode: "all", sort: "date-posted-desc", per_page: 1)
    flickr_data.each do |image|
        info = flickr.photos.getInfo :photo_id => image.id, :secret => image.secret
        posted = Time.at(info.dates.posted.to_i).to_s
        url = FlickRaw.url image
        tags = info.tags
        tag_list = tags.map{ |tag| "#{ tag }" }.join(", ")
        @articles[i] = [image.id,info.description + tag_list,url,posted]
        i=i+1
    end
    
  end #end_of_index
  
end
