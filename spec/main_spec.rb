require_relative '../bin/main'

describe '#generate_csv' do
  let(:test_array) do
    [{
      name: 'Gango',
      price: 'Ugx 9,999',
      marketcap: 'Ugx 2B',
      volume: '9,999 UTC',
      circulatingsupply: '18B UTC'
    }]
  end
  it 'should return nil if a csv file is successfully generated' do
    expect(generate_csv(test_array)).to eql(nil)
  end
end
