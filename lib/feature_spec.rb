require './lib/gilded_rose'

items = [
  Item.new(name="+5 Dexterity Vest", sell_in=10, quality=20),
  Item.new(name="Aged Brie", sell_in=2, quality=0),
  Item.new(name="Elixir of the Mongoose", sell_in=5, quality=7),
  Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=0, quality=80),
  Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=-1, quality=80),
  Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=15, quality=20),
  Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=10, quality=49),
  Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=5, quality=45),
  Item.new(name="Conjured Mana Cake", sell_in=3, quality=6), # <-- :O
]

gilded_rose = GildedRose.new(items)

gilded_rose.update_quality

p items[0].quality #expect 19
p items[1].quality # expect 1
p items[2].quality # expect 6
p items[3].quality # expect 50
p items[5].quality # expect 21
p items[6].quality # expect 50 because wants to increase by 2 but shouldn't increase above 50
p items[7].quality # expect 48
p items[8].quality # expect 4

