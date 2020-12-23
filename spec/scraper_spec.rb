require_relative '../lib/scraper'

describe Scraper do
  describe '#scrape' do
    let(:new_scraper) { Scraper.new('https://coinmarketcap.com/') }
    it 'returns an array of the top 10 most traded cryptos' do
      expect(new_scraper.scrape.length).to eql(10)
    end
  end
end
