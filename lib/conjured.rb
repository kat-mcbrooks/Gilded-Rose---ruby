require_relative 'item.rb'
class Conjured < Item
  MAX_QUALITY = 50
  def initialize(name = "Conjured Mana Cake", sell_in, quality )
    @name = name
    @sell_in = sell_in
    @quality = quality
  end
  def update_quality
    return if quality <= 0
    if @sell_in < 0 
      @quality -= 4
    else
      @quality -= 2
    end
  end
end