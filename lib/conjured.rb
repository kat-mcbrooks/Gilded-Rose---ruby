require_relative 'item.rb'
class Conjured < Item
  MIN_QUALITY = 0 #if I could alter the item class, I would put this into Item class so that all items inherity this constant
  def initialize(name = "Conjured Mana Cake", sell_in, quality )
    @name = name
    @sell_in = sell_in
    @quality = quality
  end
  def update_quality
    return if quality <= MIN_QUALITY
    if @sell_in < 0 
      @quality -= 4
    else
      @quality -= 2
    end
  end
end