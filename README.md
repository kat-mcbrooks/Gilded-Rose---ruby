# Gilded rose tech test

[My approach](#my-approach-to-structuring-the-code) |
[Assumptions](#assumptions) |
[How to run the program, with example](#how-to-run-the-code-via-irb) |
[How to run the tests](#how-to-run-the-tests-and-linter) |
[Requirements/original Kata text](#text-from-the-kata)

I have refactored, using Ruby and RSpec, the gilded rose kata (developed by Terry Hughes). The aim of this project refactored the legacy codewas to test my ability to read, refactor and extend legacy code.

### My approach to structuring the code:

- Gilded Rose class has only two public methods: update_quality and reduce_sell_in. I considered creating a 'end_day' method or similar which would call on the update_quality and reduce_sell_in methods, but in the end decided keeping both update_quality and reduce_sell_in as public methods was a more flexible approach.
- I deliberately chose to use the .include? method to check the names of items, because it read to me as if the items were categories of items and I felt this approach would allow more flexibility if the inn began selling other types of aged brie, sulfuras items, backstage passes or conjured items, which adhered to the same quality changes
- Item class remains unchanged, per the brief
- Requirements, which I have extracted from the brief form the basis of my tests:
  - At the end of the day, the system lowers sell_in value and updates the quality value for every item
  - Unless the item falls into one of the 'special' item categories as listed below, the quality decreases each day
  - Once the sell by date has passed, Quality degrades twice as fast
  - The Quality of an item is never negative
  - “Aged Brie” actually increases in Quality the older it gets
  - The Quality of an item is never more than 50
  - “Sulfuras”, being a legendary item, never has to be sold or decreases in Quality
  - “Backstage passes”, like aged brie, increases in Quality as it’s `SellIn` value approaches; Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but Quality drops to 0 after the concert
  - “Conjured” items degrade in Quality twice as fast as normal items

### Assumptions

There were a few assumptions I had to make in order to complete this challenge:

- As there is nothing explicitly stating by how much Aged Brie increases in quality, I have assumed that it continues increasing at a rate of 1 each day
- As there is nothing explicitly stating how the quality of Aged Brie changes after sell_in date, I have assumed that it continues increasing at a rate of 1
- As there is nothing explicitly stating the rate at which quality of backstage items changes with sell_in greater than 10 days, I have assumed that it increases at a rate of 1
- I have assumed that 'when sell_in date has passed' means 'when sell_in date is negative'
- I found this additional information within the 'GildedRoseRequirements.txt' regarding Sulfuras, and therefore have ensured it is excluded from the check_limits method:
  "Just for clarification, an item can never have its Quality increase above 50, however "Sulfuras" is a
  legendary item and as such its Quality is 80 and it never alters."

### How to run the code (via IRB)

1. Clone this repo
2. Install dependencies by running bundle install
3. Open irb, or your chosen REPL, loading the file:
   `irb -r './lib/gilded_rose.rb'`
4. Instantiate items, providing three parameters:
   - name (a string)
   - sell_in (an integer, which is negative if the item is passed its sell_in date)
   - quality (a postive integer)
     `item = Item.new("aged brie", 5, 6)`
5. Instantiate a GildedRose, passing an array of items:
   GildedRose.new(items)
6. Each day, run the update_quality and reduce_sell_in methods. If you forgot to run either of these one day, you will need to run them twice the next day to account for the missed day.

**See the following example of how to use the program:**

```
3.1.1 :001 > items = [Item.new(name="Elixir of the Mongoose", sell_in= 5, quality=7), Item.new(name="Sulfuras, Hand of Ragnaros", sell
_in=0, quality=80),Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in = 15, quality=20),Item.new(name="Conjured Mana C
ake", sell_in=3, quality=6), Item.new(name= "aged brie" , sell_in= - 1, quality = 7)]
3.1.1 :002 > items
 =>
[#<Item:0x0000000103035580 @name="Elixir of the Mongoose", @quality=7, @sell_in=5>,
 #<Item:0x0000000103035468 @name="Sulfuras, Hand of Ragnaros", @quality=80, @sell_in=0>,
 #<Item:0x0000000103035378 @name="Backstage passes to a TAFKAL80ETC concert", @quality=20, @sell_in=15>,
 #<Item:0x0000000103035300 @name="Conjured Mana Cake", @quality=6, @sell_in=3>,
 #<Item:0x00000001030351e8 @name="aged brie", @quality=7, @sell_in=-1>]
3.1.1 :003 > gilded_rose = GildedRose.new(items)
3.1.1 :004 > gilded_rose.update_quality
 =>
[#<Item:0x0000000103035580 @name="Elixir of the Mongoose", @quality=6, @sell_in=5>,
 #<Item:0x0000000103035468 @name="Sulfuras, Hand of Ragnaros", @quality=80, @sell_in=0>,
 #<Item:0x0000000103035378 @name="Backstage passes to a TAFKAL80ETC concert", @quality=21, @sell_in=15>,
 #<Item:0x0000000103035300 @name="Conjured Mana Cake", @quality=4, @sell_in=3>,
 #<Item:0x00000001030351e8 @name="aged brie", @quality=8, @sell_in=-1>]
3.1.1 :005 > gilded_rose.reduce_sell_in
 =>
[#<Item:0x0000000103035580 @name="Elixir of the Mongoose", @quality=6, @sell_in=4>,
 #<Item:0x0000000103035468 @name="Sulfuras, Hand of Ragnaros", @quality=80, @sell_in=-1>,
 #<Item:0x0000000103035378 @name="Backstage passes to a TAFKAL80ETC concert", @quality=21, @sell_in=14>,
 #<Item:0x0000000103035300 @name="Conjured Mana Cake", @quality=4, @sell_in=2>,
 #<Item:0x00000001030351e8 @name="aged brie", @quality=8, @sell_in=-2>]
```

### How to run the tests and linter

Install all dependencies within the project directory, per the gemfile:

```
bundle install;
```

```
rspec
rspec spec/gilded_rose_spec.rb
rspec spec/item_spec.rb
```

Simplecov does not seem to run. I'm not sure why as I've included it in the gemfile and ran bundle install so unfortunately I can't see test coverage.

To run rubocop:

```
rubocop
```

### Text from the kata

\*"Hi and welcome to team Gilded Rose. As you know, we are a small inn with a prime location in a prominent city run by a friendly innkeeper named Allison. We also buy and sell only the finest goods. Unfortunately, our goods are constantly degrading in quality as they approach their sell by date. We have a system in place that updates our inventory for us. It was developed by a no-nonsense type named Leeroy, who has moved on to new adventures. Your task is to add the new feature to our system so that we can begin selling a new category of items. First an introduction to our system:

All items have a `SellIn` value which denotes the number of days we have to sell the item. All items have a Quality value which denotes how valuable the item is. At the end of each day our system lowers both values for every item. Pretty simple, right? Well this is where it gets interesting:

- Once the sell by date has passed, Quality degrades twice as fast
- The Quality of an item is never negative
- “Aged Brie” actually increases in Quality the older it gets
- The Quality of an item is never more than 50
- “Sulfuras”, being a legendary item, never has to be sold or decreases in Quality
- “Backstage passes”, like aged brie, increases in Quality as it’s `SellIn` value approaches; Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but Quality drops to 0 after the concert

We have recently signed a supplier of conjured items. This requires an update to our system:

- “Conjured” items degrade in Quality twice as fast as normal items

Feel free to make any changes to the `UpdateQuality` method and add any new code as long as everything still works correctly. However, do not alter the Item class or Items property as those belong to the goblin in the corner who will insta-rage and one-shot you as he doesn’t believe in shared code ownership (you can make the `UpdateQuality` method and Items property static if you like, we’ll cover for you)."\*
