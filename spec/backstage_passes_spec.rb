require 'backstage_passes'
describe BackstagePasses do 
  subject(:backstage) { described_class.new(15, 20) }
  # it 'has default name backstage passes' do 
  #   expect(subject.name).to eq 'Sulfuras'
  # end
  # it 'has sell_in of infinity' do 
  #   expect(subject.sell_in).to eq Float::INFINITY
  # end 
  it 'inherits from item' do 
  
  expect(backstage.to_s).to eq "Backstage passes, 15, 20"
  end
end