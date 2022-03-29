require_relative 'item.rb'
class Sulfuras < Item
  def initialize(name = "Sulfuras")
    @name = name
    @sell_in = Float::INFINITY
    @quality = 80
  end
end

