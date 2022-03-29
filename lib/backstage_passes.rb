require_relative 'item.rb'
class BackstagePasses < Item
  def initialize(name = "Backstage passes", sell_in, quality )
    @name = name
    @sell_in = sell_in
    @quality = quality
  end
end

