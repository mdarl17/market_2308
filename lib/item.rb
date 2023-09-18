class Item
  attr_reader :name, :price

  def initialize((product_info))
    @name = product_info[:name]
    @price = product_info[:price]
  end
  
  # return 0 if  not in stock
end