#!/usr/bin/env ruby

require 'twitter'
require 'date'

# tweet_info = TweetInfo.new
@twitter = Twitter::REST::Client.new do |config|
  #   config.consumer_key = 'YOUR_CONSUMER_KEY'
  #   config.consumer_secret = 'YOUR_CONSUMER_SECRET'
  #   config.access_token = 'YOUR_ACCESS_TOKEN'
  #   config.access_token_secret = 'YOUR_ACCESS_SECRET'
  config.consumer_key = 'VL976Jq6COpnO4FhBJte6qMMO'
  config.consumer_secret = 'lUAlVNgckSdQ1DU6HSpPy4M2bipjm6UWCqozPtzD3x3wem1H4y'
  config.access_token = '1297192003965460486-EBPDzV4STHT3UFlg8UYe2Y3JbaSsRu'
  config.access_token_secret = 'UgHJi7q9htKpUxTEbvDRrd3CqNwPlU8CCX3878yI54Psw'
end

@time = Time.now
@memory = []
@selected_info = ''
@option_data_name = []

total_count = 10

@option_data_name = %w[SpaceX rails arduino]

page_one = @twitter.user_timeline(@option_data_name[0], count: total_count)
page_two = @twitter.user_timeline(@option_data_name[1], count: total_count)
page_three = @twitter.user_timeline(@option_data_name[2], count: total_count)

@option_data = [page_one, page_two, page_three]

def set_randome_page
  rand(0..option_data_name.length - 1).round
end

def set_randome_page_tweet
  rand(0..total_count - 1).round
end

def selected_tweet
  @option_data[set_randome_page][set_randome_page_tweet].full_text
end

def tweet_update
  #   puts "Fascinating stuff done by @#{@option_data_name[set_randome_page]}" + selected_tweet
  @twitter.update("Fascinating stuff done by @#{@option_data_name[@randome_page]}" + selected_tweet)
end

def memory_checker
  while ((@time.hour == 9)) && @time.min.zero?
    if @memory.include?(selected_tweet)
      set_randome.reset
      set_randome_page.reset
    else
      @memory.push(selected_tweet)
      tweet_update
    end
  end
end

# if @option_data_name.include?(@option_data_name[set_randome_page])
# puts "true"
# else
#     puts "false"
# end

# if set_randome_page == rand(0..@option_data_name.length - 1).round
#     puts "true"
#     puts set_randome_page

# else
#         puts "false"
#         puts set_randome_page

#     end

# puts @option_data_name.each_with_index(set_randome_page)
