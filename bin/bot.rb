require 'twitter'
require 'date'

time = Time.new

twitter = Twitter::REST::Client.new do |config|
    config.consumer_key        = "YOUR_CONSUMER_KEY"
    config.consumer_secret     = "YOUR_CONSUMER_SECRET"
    config.access_token        = "YOUR_ACCESS_TOKEN"
    config.access_token_secret = "YOUR_ACCESS_SECRET"
end

# checks my latest tweets

user_profile =  twitter.user_timeline("railonacosta")

spaceX_latest_tweets = twitter.user_timeline("SpaceX",count:10)
rails_latest_tweets = twitter.user_timeline("rails",count:10)
arduino_latest_tweets = twitter.user_timeline("arduino",count:10)

# spaceX_latest_tweets.each { |tweet| puts tweet.full_text }
# rails_latest_tweets.each { |tweet| puts tweet.full_text }
# arduino_latest_tweets.each { |tweet| puts tweet.full_text }

option_data_name = ["SpaceX","rails","arduino"]

# An array that holds the three pages

option_data = [spaceX_latest_tweets,rails_latest_tweets,arduino_latest_tweets]

# I need a counter thats randome

randome_number_01 = rand(0..2).round
randome_number_02 = rand(0..9).round

# The randome selector between (0..9) [rand][rand]

selected_info = option_data[randome_number_01][randome_number_02].full_text

  puts "Fascinating stuff done by @#{option_data_name[randome_number_01]} #{selected_info}"


#  unless ((time.hour == 18) && (time.min == 40))

#      twitter.update("Fascinating stuff done by @#{option_data_name[randome_number_01]} #{selected_info}")

#   end
