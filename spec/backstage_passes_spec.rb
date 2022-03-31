require 'backstage_passes'
describe BackstagePass do 
  subject(:backstage) { described_class.new(15, 20) }
  it 'quality drops to zero after concert has passed i.e. when <=0' do 
    bp_post_concert = BackstagePass.new(0, 15)
    bp_post_concert.update_quality
    expect(bp_post_concert.to_s).to eq "Backstage pass, 0, 0"
  end
  it 'quality increases by 3 if 5 or less days until concert' do 
    bp_final_days = BackstagePass.new(5, 15)
    bp_final_days.update_quality
    expect(bp_final_days.to_s).to eq "Backstage pass, 5, 18"
  end
  it 'quality increases by 2 if there are between 6 and 10 days until concert' do 
    bp_mid_sell_in = BackstagePass.new(10, 15)
    bp_mid_sell_in.update_quality
    expect(bp_mid_sell_in.to_s).to eq "Backstage pass, 10, 17"
  end
  it 'quality increases by 1 if there are more than 10 days until concert' do 
    bp_many_days_pre = BackstagePass.new(11, 15)
    bp_many_days_pre.update_quality
    expect(bp_many_days_pre.to_s).to eq "Backstage pass, 11, 16"
  end
end