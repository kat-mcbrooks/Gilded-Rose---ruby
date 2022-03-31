require 'gilded_rose'
require 'regular_item'
require 'backstage_passes'
describe GildedRose do
  let(:regular_item) { double(:regular_item, sell_in: 5) }
  let(:sulfuras_item) { double(:sulfuras_item) }
  before do 
    allow(regular_item).to receive(:update_quality)
    allow(sulfuras_item).to receive(:update_quality)
    allow(regular_item).to receive(:reduce_sell_in)
    allow(sulfuras_item).to receive(:reduce_sell_in)
  end
  describe "#update_items_quality" do
  let(:regular_item) { double(:regular_item, sell_in: 5) }
  let(:sulfuras_item) { double(:sulfuras_item) }
  before do 
    allow(regular_item).to receive(:update_quality)
    allow(sulfuras_item).to receive(:update_quality)
    allow(regular_item).to receive(:reduce_sell_in)
    allow(sulfuras_item).to receive(:reduce_sell_in)
  end
    it 'updates regular item quality' do 
      expect(regular_item).to receive(:update_quality)
      gilded_rose = GildedRose.new([regular_item])
      gilded_rose.update_items_quality
    end
    it 'updates all items quality' do 
      expect(sulfuras_item).to receive(:update_quality) 
      expect(regular_item).to receive(:update_quality) #not supposed to have two expects in one test, but otherwise not sure how to test that it's updating all items within the items array
      gilded_rose = GildedRose.new([regular_item, sulfuras_item])
      gilded_rose.update_items_quality
    end
  end

  describe '#reduce sell_in' do 
    # gilded_rose_2 = GildedRose.new([RegularItem.new('milk', 5, 5)]) # I couldn't work out how to mock this here, whilst still testing that the sell_in date changes. I'm right in thinking that if I created a double, I could stub the sell_in property but then it wouldn't change
    #Attempted to mock, but I get the Failure/Error: item.sell_in -= 1
       #<Double :regular_item> received unexpected message :sell_in= with (4)
    # it 'reduces sell_in of items by one' do
    #   gilded_rose_2 = GildedRose.new([regular_item])
    #   gilded_rose_2.reduce_sell_in
    #   expect(gilded_rose_2.items[0].sell_in).to eq 4
    # end

    it 'reduces sell_in of all items by one' do
      gilded_rose_2 = GildedRose.new([RegularItem.new('milk', 5, 5), BackstagePass.new('backstage pass', 4, 4)])
      gilded_rose_2.reduce_sell_in
      expect(gilded_rose_2.items[0].sell_in).to eq 4
      expect(gilded_rose_2.items[1].sell_in).to eq 3
    end
  

  end

end
