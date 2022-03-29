require_relative 'item.rb'
class AgedBrie < Item
  MAX_QUALITY = 50
  def initialize(name = "Aged Brie", sell_in, quality )
    @name = name
    @sell_in = sell_in
    @quality = quality
  end
  def update_quality
    @quality == MAX_QUALITY ? return : @quality += 1
  end
end