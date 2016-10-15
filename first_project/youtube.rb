class Item
  def initialize(options)
    @price = options[:price]
    @weight = options[:weight]
  end

  attr_reader :price, :weight
  attr_writer :price
end

item1 = Item.new({:price => 23, :weight => 45})
puts item1.price
# item1.price = 24
# puts item1.price

my_data = {:name => "James", :family_name => "Bond"}
puts my_data[:name]
puts my_data[:family_name]
puts my_data

username = "hi there"
# s = 'split s'.split[0]
# puts s
username = username.chomp("t")

# username = username.gsub(' ','')
puts username