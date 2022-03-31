require './lib/item' 
require './lib/sulfuras'
class GildedRose
MAX_QUALITY = 50
MIN_QUALITY = 0

attr_reader :items

  def initialize(items = [])
    @items = items 
  end

  def update_items_quality
    @items.each do |item|
      item.update_quality unless item.instance_of?(Sulfuras) 
    end
  end

  def reduce_sell_in
    @items.each do |item|
      item.sell_in -= 1
    end
  end

end
