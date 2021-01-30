#!/usr/env ruby

require 'twitter'
require 'date'
require 'dotenv'

Dotenv.load

require_relative '../lib/tweet_methods'

tweet = TweetBotMethods

tweet.tweet_update
