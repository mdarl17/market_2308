require './lib/vendor'
require './lib/item'

describe Vendor do
  before(:each) do
    @vendor = Vendor.new("Rocky Mountain Fresh")
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
  end
  describe '#initialize' do
    it 'instantiates an instance of the Vendor class' do
      expect(@vendor).to be_a Vendor
    end
    it 'is created with a name' do
      expect(@vendor.name).to eq('Rocky Mountain Fresh')
    end
    it 'is created with an empty inventory hash' do
      expect(@vendor.inventory).to eq({})
    end
    describe '#check_stock' do
      it 'has a method that returns info about a product or 0 if product not in stock' do

        expect(@vendor.check_stock(@item1)).to eq(0)
      end
    end
    describe '#stock' do
      it 'has a method to stock items in inventory' do
        @vendor.stock(@item1, 30)
        expect(@vendor.inventory).to eq(@item1=>30)
      end
      it 'adds to the stock in inventory' do
        @vendor.stock(@item1, 30)
        @vendor.stock(@item2, 12)
        expect(@vendor.check_stock(@item1)).to eq(30)
        @vendor.stock(@item1, 25)
        expect(@vendor.check_stock(@item1)).to eq(55)
        expect(@vendor.inventory).to eq(@item1=>55, @item2=>12)
      end
    end
  end
end