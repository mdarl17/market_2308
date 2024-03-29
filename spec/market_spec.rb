require  './lib/item'
require './lib/vendor'
require './lib/market'
require 'pry'

describe Market do
  before(:each) do
    @market = Market.new("South Pearl Street Farmers Market")
    @vendor1 = Vendor.new("Rocky Mountain Fresh")
    @vendor2 = Vendor.new("Ba-Nom-a-Nom")
    @vendor3 = Vendor.new("Palisade Peach Shack")   
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: "$0.50"})
    @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    @vendor1.stock(@item1, 35)
    @vendor2.stock(@item4, 50)
    @vendor3.stock(@item1, 65)
  end
  describe '#initialize' do
    it 'exists' do
      expect(@market).to be_a Market
    end
    it 'is created with a vendor name' do
      expect(@market.name).to eq("South Pearl Street Farmers Market")
    end
    it 'is created with an empty list of Vendor names' do
      expect(@market.vendor_names).to eq([])
    end
  end
  describe '#add_vendor' do
    it 'can return a list of vendors' do
      expect(@market.vendors).to eq([])
      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)
      @market.add_vendor(@vendor3)
      expect(@market.vendors).to eq([@vendor1, @vendor2, @vendor3])
    end
  end
  describe '#vendor_names' do
    it 'has a method to return a list of vendor names' do
      expect(@market.vendor_names).to eq([])
      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)
      @market.add_vendor(@vendor3)
      expect(@market.vendor_names).to eq([@vendor1.name, @vendor2.name, @vendor3.name])
    end
  end
  describe '#vendors_that_sell' do
    it 'can return a list of vendors that sell a particular item' do
      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)
      @market.add_vendor(@vendor3)
      expect(@market.vendors_that_sell(@item1)).to eq([@vendor1, @vendor3])
    end
  end
  describe '#pontential_revenue' do
    it 'can calculate a vendor\'s revenue if they sold all of their products at listed price' do
      expect(@vendor1.potential_revenue).to eq(26.25)
    end
  end
end