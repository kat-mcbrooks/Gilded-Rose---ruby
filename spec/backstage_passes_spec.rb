require 'backstage_passes'
describe BackstagePass do 
  subject(:backstage) { described_class.new(15, 20) }
  # it 'has default name backstage passes' do 
  #   expect(subject.name).to eq 'Sulfuras'
  # end
  # it 'has sell_in of infinity' do 
  #   expect(subject.sell_in).to eq Float::INFINITY
  # end 
  it 'inherits from item' do 
    
    expect(backstage.to_s).to eq "Backstage pass, 15, 20"
  end
  it 'quality is always zero after concert has passed i.e. when <=0' do 
    bp_post_concert = BackstagePass.new(0, 15)
    bp_post_concert.update_quality
    expect(bp_post_concert.to_s).to eq "Backstage pass, 0, 0"
  end
end