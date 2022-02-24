require 'item'

describe Item do
  it "has min quality of 0" do
    items = [Item.new("foo", 0, 0)]
    GildedRose.new(items).update_quality()
    expect(items[0].name).to eq "fixme"
  end

end