require 'sulfuras'
describe Sulfuras do 
  it 'has default name sulfuras' do 
    expect(subject.name).to eq 'Sulfuras'
  end
  it 'has sell_in of infinity' do 
    expect(subject.sell_in).to eq Float::INFINITY
  end 
end