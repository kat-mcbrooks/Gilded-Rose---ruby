require_relative 'item.rb'
class BackstagePass < Item
  def initialize(name = "Backstage pass", sell_in, quality )
    @name = name
    @sell_in = sell_in
    @quality = quality
  end
  def update_quality
    case @sell_in
    when - Float::INFINITY..0
      @quality = 0
    when 0..5
      @quality += 3
    when 6..10
      @quality += 2
    else
      @quality += 1
    end
  end
end

