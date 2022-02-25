require './lib/item' 

class GildedRose
MAX_QUALITY = 50
MIN_QUALITY = 0

attr_reader :items

  def initialize(items = [])
    @items = items 
  end

  def update_quality()
    @items.each do |item|
      check_name(item)
      check_limits(item) unless item.name.downcase.include?("sulfuras")
    end
  end

  def reduce_sell_in
    @items.each do |item|
      item.sell_in -= 1
    end
  end

  private
  def check_name(item)
    if item.name.downcase.include?("sulfuras")
      return #do not update quality
    elsif item.name.downcase.include?("backstage passes")
      update_backstage(item)
      return
    elsif item.name.downcase.include?("aged brie")
      update_brie(item)
      return
    elsif item.name.downcase.include?("conjured")
      update_conjured(item)
      return
    else 
      decrease_quality(item)
      return
    end
  end

  def decrease_quality(item)
    if item.sell_in < 0 
      item.quality -= 2
    else
      item.quality -= 1
    end
  end  

  def update_brie(item)
    item.quality += 1
  end

  def update_backstage(item)
    case item.sell_in
    when - Float::INFINITY..0
      item.quality = 0
    when 0..5
      item.quality += 3
    when 6..10
      item.quality += 2
    else
      item.quality += 1
    end
  end

  def update_conjured(item)
    if item.sell_in < 0 
      item.quality -= 4
    else
      item.quality -= 2
    end
  end

  def check_limits(item)
    if item.quality < MIN_QUALITY
      item.quality = MIN_QUALITY
    elsif item.quality > MAX_QUALITY
      item.quality = MAX_QUALITY
    end
  end  

end
