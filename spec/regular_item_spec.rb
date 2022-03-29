require 'regular_item'
describe RegularItem do 
  min_quality = RegularItem::MIN_QUALITY
  subject(:regular_item) { described_class.new("dexterity vest", 0, 1) }
  it 'quality decreases by 1 if before sell_in date' do 
    regular_item.update_quality
    expect(regular_item.to_s).to eq "dexterity vest, 0, 0"
  end
  it 'quality decreases by 2 if after sell_in date' do 
    regular_item.sell_in -= 1
    regular_item.update_quality
    expect(regular_item.to_s).to eq "dexterity vest, -1, -1"
  end
  it 'quality never reduces below minimum quality' do 
    2.times { regular_item.update_quality }
    expect(regular_item.to_s).to eq "dexterity vest, 0, 0"
  end
end