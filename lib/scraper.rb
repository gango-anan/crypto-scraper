require 'nokogiri'
require 'httparty'

class Scraper
  attrib_reader: url

  def initialize(url)
    @url = url
  end

  def scrape
    url = 'https://coinmarketcap.com/'
    unparsed_page = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(unparsed_page.body)
    cryptos = Array.new
    crypto_details = parsed_page.css('tbody > tr')
    populate_crypto(crypto_details)
  end

  private
  def populate_crypto(crypto_details)
    10.times do |index|
      crypto = {
        name: crypto_details[index].css('div > p.sc-1eb5slv-0.iJjGCS').text,
        price: crypto_details[index].css('div.price___3rj7O>a.cmc-link').text,
        marketcap: crypto_details[index].css('td>p.sc-1eb5slv-0.kDEzev').text,
        volume: crypto_details[index].css('p.sc-1eb5slv-0.etpvrL').text,
        circulatingsupply: crypto_details[index].css('div>p.sc-1eb5slv-0.hNpJqV').text
      }
      cryptos << crypto
    end
    cryptos
  end

end