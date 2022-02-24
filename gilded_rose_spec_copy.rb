require 'gilded_rose'

describe GildedRose do
  max_quality = GildedRose::MAX_QUALITY
  min_quality = GildedRose::MIN_QUALITY

  let(:vest) { double(:vest, name: "+5 Dexterity Vest", quality: 0, sell_in: 2) }
  let(:brie) { double(:brie, name: "Aged Brie", quality: 0, sell_in: 2) }
  let(:elixir) { double(:elixir, name: "Elixir of the Mongoos", quality: 7, sell_in: 5) }
  let(:sulfuras_1) { double(:sulfuras_1, name: "Sulfuras, Hand of Ragnaros", quality: 80, sell_in: 0) }
  let(:sulfuras_2) { double(:sulfuras_2, name: "Sulfuras, Hand of Ragnaros", quality: 80, sell_in: 1) }
  let(:backstage_1) { double(:backstage_1, name: "Backstage passes to a TAFKAL80ETC concert", quality: 20, sell_in: 15) }
  let(:backstage_2) { double(:backstage_2, name: "Backstage passes to a TAFKAL80ETC concert", quality: 49, sell_in: 10) }
  let(:backstage_3) { double(:backstage_3, name: "Backstage passes to a TAFKAL80ETC concert", quality: 49, sell_in: 5) }
  let(:conjured) { double :conjured, name: "Conjured Mana Cake", quality: 6, sell_in: 3 }

  let(:items) { [vest, brie, elixir, sulfuras_1, sulfuras_2, backstage_1, backstage_2, backstage_3, conjured] }

  subject(:gilded_rose) {described_class.new(items)}

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end

    it 'increases brie quality' do 
      p items[1]
      gilded_rose.update_quality
      gilded_rose.reduce_sell_in
      expect(items[0].to receive(:quality).with(-1)
    end

    it 'does not increase an item quality above max_quality' do 

    end 

  end

  describe '#reduce sell_in' do 
    it 'reduces sell_in of items by one' do
      gilded_rose.reduce_sell_in
      expect(brie.sell_in).to eq 1
    end
  end

end
