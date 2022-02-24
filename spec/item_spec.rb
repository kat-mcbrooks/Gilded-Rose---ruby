require 'item'

describe Item do
  item = Item.new("aged brie", 5, 6)

  it 'can print its name, sell in and quality' do 
    expect(item.to_s).to eq "aged brie, 5, 6"
  end

end