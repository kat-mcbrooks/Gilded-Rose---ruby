require 'conjured'
describe Conjured do 
  max_quality = Conjured::MAX_QUALITY
  subject(:conjured) { described_class.new(15, 20) }
  it 'quality decreases by 2 before sell_in date' do 
    conjured.update_quality
    expect(conjured.to_s).to eq "Conjured Mana Cake, 15, 18"
  end
  it 'quality decreases by 4 after sell_in' do 
    conjured.sell_in -= 16
    conjured.update_quality
    expect(conjured.to_s).to eq "Conjured Mana Cake, -1, 16"
  end
end