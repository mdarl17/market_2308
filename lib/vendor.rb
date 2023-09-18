class Vendor
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    return 0 if !@inventory[item]
    return @inventory[item]
  end

  def stock(item, qty)
    if @inventory[item]
      @inventory[item] += qty
    else
      @inventory[item] = qty
    end
  end

  def potential_revenue
    total_revenue = 0
    @inventory.each do |item, qty|
      if item.price[1..2] == "0."
        total_revenue += item.price[1..-1].to_f * qty
      else
        total_revenue += item.price.to_f * qty
      end
    end
    total_revenue
  end
end