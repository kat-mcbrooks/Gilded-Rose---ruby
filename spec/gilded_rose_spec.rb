require 'gilded_rose'

describe GildedRose do
  max_quality = GildedRose::MAX_QUALITY
  min_quality = GildedRose::MIN_QUALITY

  items = [
    Item.new(name = "+5 Dexterity Vest", sell_in = 10, quality = 20),
    Item.new(name = "Aged Brie", sell_in=2, quality = 0 ),
    Item.new(name = "Elixir of the Mongoose", sell_in = 5, quality = 7), 
    Item.new(name = "Sulfuras, Hand of Ragnaros", sell_in = 0, quality = 80),
    Item.new(name = "Sulfuras, Hand of Ragnaros", sell_in = -1, quality = 80), 
    Item.new(name = "Backstage passes to a TAFKAL80ETC concert", sell_in = 15, quality = 0),
    Item.new(name = "Backstage passes to a TAFKAL80ETC concert", sell_in = 10, quality = 46),
    Item.new(name = "Backstage passes to a TAFKAL80ETC concert", sell_in = 5, quality = 49),
    Item.new(name = "Conjured Mana Cake", sell_in = 3, quality = 6),
    Item.new(name = "Conjured Mana Cake", sell_in = 3, quality = 1), 
    Item.new(name = "general item", sell_in = - 1, quality = 7),
    Item.new(name = "aged brie" , sell_in = - 1, quality = 7), 
    Item.new(name = "Conjured Mana Cake", sell_in = -1 , quality = 6), 
    Item.new(name = "Backstage passes to a TAFKAL80ETC concert", sell_in = 5, quality = 46),
    Item.new(name = "Backstage passes to a TAFKAL80ETC concert", sell_in = -1, quality = 46),
  ]
  #subject(:gilded_rose) {described_class.new(items)}
  gilded_rose = GildedRose.new(items)

  describe "#update_quality" do
    gilded_rose.update_quality
    
    it "does not change the name" do
      expect(gilded_rose.items[0].name).to eq "+5 Dexterity Vest"
    end

    # The Quality of an item is never more than 50
    it 'does not increase an item quality above max_quality' do 
      expect(gilded_rose.items[7].quality).to eq 50
    end 

    # The Quality of an item is never negative
    it 'does not decrease an item quality below min_quality' do 
      expect(gilded_rose.items[9].quality).to eq 0
    end 

    it 'decreases regular item quality by 1 before sell_in date' do 
      expect(gilded_rose.items[0].quality).to eq 19
    end
    
    # "Sulfuras", being a legendary item, never has to be sold or decreases in Quality
    it 'does not change sulfuras quality' do 
      expect(gilded_rose.items[3].quality).to eq 80
    end 

    # Once the sell by date has passed, Quality degrades twice as fast
    it 'decreases regular item quality by 2 after sell_in date' do 
      expect(gilded_rose.items[10].quality).to eq 5
    end

    # "Conjured" items degrade in Quality twice as fast as normal items:
    it 'decreases conjured item quality by 2 before sell_in date' do 
      expect(gilded_rose.items[8].quality).to eq 4
    end
    it 'decreases conjured item quality by 4 after sell_in date' do 
      expect(gilded_rose.items[12].quality).to eq 2
    end
    
    # "Aged Brie" actually increases in Quality the older it gets
    it 'increases brie quality' do 
      expect(gilded_rose.items[1].quality).to eq 1
    end
    
    it 'continues to increase brie quality after sell_in date' do 
      expect(gilded_rose.items[11].quality).to eq 8
    end

    # "Backstage passes", like aged brie, increases in Quality as its SellIn value approaches;
    it 'increases backstage quality by 3 when sell_in is 5 days or less' do 
      expect(gilded_rose.items[13].quality).to eq 49
    end
    it 'increases backstage quality by 2 when sell_in is between 6 and 10 days' do 
      expect(gilded_rose.items[6].quality).to eq 48
    end
    it 'drops quality to 0 after sell in date' do #	Quality drops to 0 after the concert
      gilded_rose.items[14]
      expect(gilded_rose.items[14].quality).to eq 0
    end
  end

  describe '#reduce sell_in' do 
    gilded_rose_3 = GildedRose.new([Item.new(name="+5 Dexterity Vest", sell_in=10, quality=20), Item.new(name="Aged Brie", sell_in=2, quality=0) ])
    it 'reduces sell_in of items by one' do
      gilded_rose_3.reduce_sell_in
      expect(gilded_rose_3.items[0].sell_in).to eq 9
    end
    it 'reduces sell_in of items by one' do
      expect(gilded_rose_3.items[1].sell_in).to eq 1
    end
  end

end
