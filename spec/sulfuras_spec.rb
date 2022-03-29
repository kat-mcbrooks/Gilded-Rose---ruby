require 'sulfuras'
describe Sulfuras do 
  it 'has sell_in of infinity, quality 80 and default name Sulfuras' do 
    expect(subject.to_s).to eq "Sulfuras, Infinity, 80"
  end 
end