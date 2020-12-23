#!/usr/bin/env ruby

# frozen_string_literal: true

require 'csv'
require_relative '../lib/scraper'

scraped_page = Scraper.new('https://coinmarketcap.com/')
cryptos = scraped_page.scrape
crypto_details = []
10.times do |index|
  crypto_details << cryptos[index]
end

filepath = 'scrape.csv'
csv_options = { headers: :first_row, col_sep: ',' }
CSV.open(filepath, 'wb', csv_options) do |csv|
  csv << ['Name', 'Price', 'Market Cap', 'Volume', 'Circulating Supply']
  crypto_details.each do |crypto|
    csv << crypto.values
  end
end
