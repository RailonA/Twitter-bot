#!/usr/bin/env ruby

require './bin/bot'

describe '#set_randome_page' do
  let(:option_data_name) { @option_data_name = %w[SpaceX rails arduino] }
  let(:option_data) { @option_data = [page_one, page_two, page_three] }

  it 'Check set_randome_page return a number between the range of 0..(array.length -1)' do
    expect(set_randome_page.between?(0, 2)).to eql(true)
  end
  it 'Check set_randome_page does mot return a number greater than 0..(array.length -1)' do
    expect(set_randome_page.between?(3, 10)).not_to eql(true)
  end
end

describe '#set_randome_page_tweet' do
  let(:total_count) { total_count = 10 }
  it 'Check set_randome_page_tweet return a number between the range of 0..9' do
    expect(set_randome_page_tweet.between?(0, 9)).to eql(true)
  end
  it 'Check set_randome_page_tweet does mot return a number greater than range of 0..9' do
    expect(set_randome_page_tweet.between?(10, 20)).not_to eql(true)
  end
end

describe '#selected_tweet' do
  let(:total_count) {total_count = 10 }
  let(:option_data_name) { @option_data_name = %w[SpaceX rails arduino] }
  let(:option_data){@option_data = []}
  it 'Check selected_tweet return amulti dimensional array' do
    expect(option_data.each.include?(selected_tweet)).to eql(true)
  end
end

# def selected_tweet
#   let(:option_data) { @option_data = [page_one, page_two, page_three] }
#   @option_data[set_randome_page][set_randome_page_tweet].full_text
# end
