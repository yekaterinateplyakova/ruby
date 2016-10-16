require_relative "item_container"
require_relative "cart"
require_relative "order"
require_relative "item"
require_relative "virtual_item"
require_relative "real_item"

# cart = Cart.new
# cart.add_item(Item.new)
# cart.add_item(Item.new)
# cart.validate
#
# p cart.items
#
# cart.remove_item
#
# p cart.items

item = VirtualItem.new ({:price => 101, :weight => 100, :name => "Car"})
item2 = RealItem.new ({:weight => 100,:price => 101, :name => "Car"})
item3 = RealItem.new ({:weight => 12, :price => 101, :name => "Game"})

#item.info {|attr| puts attr}
cart = Cart.new
cart.add_item item
cart.add_item item2
cart.add_item item3

puts cart.items.size

# p cart
# cart.delete_invalid_items
# p cart
#
# p item.respond_to?(:weight)
# p item2.respond_to?(:weight)

# puts item.price
# puts item.real_price
# puts item.tax

# order = Order.new
# order.add_item item
# order.add_item item2
# order.add_item item3
# puts order.items.size

#puts order.count_valid_items

@items = []
@items << VirtualItem.new({:price => 101, :weight => 100, :name => "Car"})
@items << RealItem.new ({:weight => 100,:price => 101, :name => "Car"})
@items << RealItem.new ({:weight => 12, :price => 101, :name => "Game"})
