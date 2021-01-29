#!/usr/.env ruby

require 'twitter'
require 'date'

# Description/TweetKeys class returns the keys of the user
class TweetBotMethods
  attr_accessor :tweet

  # @tweet = Twitter::REST::Client.new do |config|
  #   config.consumer_key = 'QTECXfqoLw5HH6mFbZQvhaGcF'
  #   config.consumer_secret = 'xtpW0hHuDu1Da8RToXivFau0rdXB3Ojh2OgT0Wu61a8bqC7Ruo'
  #   config.access_token = '1297192003965460486-gjIvXkf92HIMfXfBnPq9AClD0vpySu'
  #   config.access_token_secret = 'dwjBLkwcNmR9kmgpv0bJxELH2dpbabHCfHvYjY4rnW2ci'
  # end

  @tweet = Twitter::REST::Client.new do |config|
    config.consumer_key = ENV['CONSUMER_KEY']
    config.consumer_secret = ENV['CONSUMER_SECRET']
    config.access_token = ENV['ACCESS_TOKEN']
    config.access_token_secret = ENV['ACCESS_TOKEN_SECRET'] 
  end

  @time = Time.new
  @total_count = 10
  @option_data_name = %w[SpaceX rails arduino]

  @page_one = @tweet.user_timeline(@option_data_name[0], count: @total_count)
  @page_two = @tweet.user_timeline(@option_data_name[1], count: @total_count)
  @page_three = @tweet.user_timeline(@option_data_name[2], count: @total_count)

  @option_data = [@page_one, @page_two, @page_three]

  def self.set_randome_page
    @randome_page = rand(0...3).round
  end

  def self.set_randome_page_tweet
    @randome_page_tweet = rand(0...10).round
  end

  def self.selected_tweet
    @option_data[set_randome_page][set_randome_page_tweet].full_text
  end

  def self.tweet_update
    puts "Fascinating stuff done by @#{@option_data_name[set_randome_page]}" + selected_tweet
    #   @twitter.update("Fascinating stuff done by @#{@option_data_name[@randome_page]}" + selected_tweet)
  end
end

def self.memory_checker
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
