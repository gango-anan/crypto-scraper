require 'nokogiri'
require 'httparty'

# This is a class designed to scrape CoinMarketCap
class Scraper
  attr_reader :url

  def initialize(new_url)
    @url = new_url
  end

  def scrape
    row_page = HTTParty.get(@url)
    filtered_page = Nokogiri::HTML(row_page.body)
    cryptos = []
    crypto_details = filtered_page.css('tbody > tr')
    populate_crypto(crypto_details, cryptos)
    cryptos
  end

  private

  def populate_crypto(crypto_details, cryptos)
    crypto_details.each do |crypto_detail|
      crypto = {
        name: crypto_detail.css('div > p.sc-1eb5slv-0.iJjGCS').text,
        price: crypto_detail.css('div.price___3rj7O>a.cmc-link').text,
        marketcap: crypto_detail.css('td>p.sc-1eb5slv-0.kDEzev').text,
        volume: crypto_detail.css('p.sc-1eb5slv-0.etpvrL').text,
        circulatingsupply: crypto_detail.css('div>p.sc-1eb5slv-0.hNpJqV').text
      }
      cryptos << crypto
    end
  end
end
