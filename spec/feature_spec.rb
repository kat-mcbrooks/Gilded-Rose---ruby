require './lib/gilded_rose'

describe GildedRose do
  max_quality = GildedRose::MAX_QUALITY
  min_quality = GildedRose::MIN_QUALITY

  items = [
    Item.new(name="+5 Dexterity Vest", sell_in=10, quality=20),
    Item.new(name="Aged Brie", sell_in=2, quality=0),
    Item.new(name="Elixir of the Mongoose", sell_in= 5, quality=7),
    Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=0, quality=80),
    Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=-1, quality=80), #unecessary?
    Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in = 15, quality=20),
    Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in = 10, quality=49),
    Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in = 5, quality=49),
    Item.new(name="Conjured Mana Cake", sell_in=3, quality=6),
    Item.new(name="Conjured Mana Cake", sell_in=3, quality=1), 
    Item.new(name="general item", sell_in= - 1, quality = 7),
    Item.new(name= "aged brie" , sell_in= - 1, quality = 7), 
    Item.new(name= "Conjured Mana Cake", sell_in = -1 , quality = 6), 
    Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=5, quality=46),
    Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in = -1, quality=46),
  ]
  gr = GildedRose.new(items)

  it 'updating quality reduces non-special items quality by 1' do 
  end
end
