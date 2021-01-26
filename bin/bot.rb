#!/usr/bin/env ruby

require 'twitter'
require 'date'

require '../lib/user_info'


  twitter = Twitter::REST::Client.new do |config|
    config.consumer_key        = "YOUR_CONSUMER_KEY"
    config.consumer_secret     = "YOUR_CONSUMER_SECRET"
    config.access_token        = "YOUR_ACCESS_TOKEN"
    config.access_token_secret = "YOUR_ACCESS_SECRET"

  end
  @time = Time.now

  @randome_page = 0
  @randome_page_tweet = 0
  @selected_info = ""
  @option_data_name = ["","",""]

  @total_count = 10
  

  page_one = twitter.user_timeline('SpaceX', count: @total_count)
  page_two = twitter.user_timeline('rails', count: @total_count)
  page_three = twitter.user_timeline('arduino', count: @total_count)


  @option_data_name = %w[SpaceX rails arduino]

  @option_data = [page_one, page_two, page_three]

  def set_randome
  @randome_page = rand(0..@option_data_name.length-1).round
  @randome_page_tweet = rand(0..@total_count-1).round
  end

def selected_tweet
  selected_info = @option_data[@randome_page][@randome_page_tweet].full_text
end
  
#   puts "Fascinating stuff done by @#{@option_data_name[@randome_page]}" + selected_tweet 
def daily_print
 while ((@time.hour == 12) && (@time.min == 0)) do
     twitter.update("Fascinating stuff done by @#{@option_data_name[@randome_page]}" + selected_tweet )
  end
end