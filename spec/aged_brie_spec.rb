require 'aged_brie'
describe AgedBrie do 
  max_quality = AgedBrie::MAX_QUALITY
  subject(:brie) { described_class.new(15, 20) }
  it 'quality increases by 1' do 
    brie.update_quality
    expect(brie.to_s).to eq "Aged Brie, 15, 21"
  end
  it 'quality never exceeds max quality' do 
    brie_at_max = AgedBrie.new(10, 50)
    brie_at_max.update_quality
    expect(brie_at_max.to_s).to eq "Aged Brie, 10, 50"
  end
end