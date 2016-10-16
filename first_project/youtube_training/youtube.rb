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

puts "------------------"
names = ["Bob", "James", "John"]
names.push("Kate") #add a name at the end
puts names
names.pop #remove a last name
puts names
names.shift #remove the first name
puts "------------------"
puts names[1]

names.each {|name| puts "Hello " + name}

puts "------------------"

3.times { puts "Hello"}
puts "------------------"

james_bond = {:first_name => "James", :middle_name => "Robert", :last_name => "Bond"}
james_bond.each_key {|key| puts key }
james_bond.each_key {|key| puts james_bond[key] }

File.open("/tmp/blocks.txt", "w") {|f| f.puts "hello world"}


