class Order
  attr_reader :items

  include ItemContainer

  def initialize
    @items = Array.new #or @items = []
    #....
  end

  def place
    #actually place an order
  end
end