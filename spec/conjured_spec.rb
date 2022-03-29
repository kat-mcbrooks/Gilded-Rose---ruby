require 'conjured'
describe Conjured do 

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
  it 'quality can be reduced to 0' do 
    10.times { conjured.update_quality }
    expect(conjured.to_s).to eq "Conjured Mana Cake, 15, 0"
  end
  
  it 'quality never reduces below min quality i.e. 0' do 
    10.times { conjured.update_quality }
    conjured.update_quality
    expect(conjured.to_s).to eq "Conjured Mana Cake, 15, 0"
  end
end