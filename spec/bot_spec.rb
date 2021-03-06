require_relative '../bin/bot'

tweet = TweetBotMethods
tweet.tweet_update

describe '#set_randome_page' do
  let(:option_data_name) { @option_data_name = %w[SpaceX rails arduino] }
  let(:option_data) { @option_data = [page_one, page_two, page_three] }

  it 'Check set_randome_page return a number between the range of 0..(array.length -1)' do
    expect(tweet.set_randome_page.between?(0, 2)).to eql(true)
  end
  it 'Check set_randome_page does mot return a number greater than 0..(array.length -1)' do
    expect(tweet.set_randome_page.between?(3, 10)).not_to eql(true)
  end
end

describe '#set_randome_page_tweet' do
  let(:total_count) { @total_count = 10 }
  it 'Check set_randome_page_tweet return a number between the range of 0..9' do
    expect(tweet.set_randome_page_tweet.between?(0, total_count)).to eql(true)
  end
  it 'Check set_randome_page_tweet does mot return a number greater than range of 0..9' do
    expect(tweet.set_randome_page_tweet.between?(10, 20)).not_to eql(true)
  end
end

describe '#selected_tweet' do
  let(:total_count) { @total_count = 10 }
  let(:option_data_name) { @option_data_name = %w[SpaceX rails arduino] }
  let(:option_data) { @option_data = [] }
  it 'Check selected_tweet return an element from option_data_name' do
    expect(tweet.selected_tweet.include?(option_data[0])).to eql(true) if option_data[0]
  end

  it 'Check selected_tweet return the correct element choosen from within option_data_name ' do
    expect(tweet.selected_tweet.include?(option_data[2])).not_to eql(true) if option_data[0]
  end
end

describe '#tweet_update' do
  let(:total_count) { @total_count = 10 }
  let(:option_data_name) { @option_data_name = %w[SpaceX rails arduino] }
  let(:option_data) { @option_data = [] }
  it 'Check tweet_update return an element from option_data_name' do
    expect(tweet.tweet_update.include?(option_data[0])).to eql(true) if option_data[0]
  end
  it 'Check tweet_update return the correct element choosen from within option_data_name' do
    expect(tweet.tweet_update.include?(option_data[1])).not_to eql(true) if option_data[0]
  end
end
