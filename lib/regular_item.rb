require_relative 'item.rb'
class RegularItem < Item
  MIN_QUALITY = 0
  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end
  def update_quality
    return if @quality <= 0
    @sell_in < 0 ? @quality -= 2 : @quality -= 1
  end

end