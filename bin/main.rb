# !/usr/bin/env ruby

require 'csv'
require_relative '../lib/scraper'

def generate_csv(crypto_details)
  filepath = 'scrape.csv'
  csv_options = { headers: :first_row, col_sep: ',' }
  CSV.open(filepath, 'wb', csv_options) do |csv|
    csv << ['Name', 'Price', 'Market Cap', 'Volume', 'Circulating Supply']
    crypto_details.each do |crypto|
      csv << crypto.values
    end
  end
  nil
end

scraped_page = Scraper.new('https://coinmarketcap.com/')
cryptos = scraped_page.scrape
crypto_details = []
10.times do |index|
  crypto_details << cryptos[index]
end
generate_csv(crypto_details)
puts ''
puts '           ========Thanks for using Crypto Scraper.========'
puts ''
puts "Your scrape csv file has been created in the Application's directory."
