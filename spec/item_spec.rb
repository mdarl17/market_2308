require './lib/item'

describe Item do
  before(:each) do
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
  end
  describe '#initialize' do
    it 'instantiates an instance of Item' do
      expect(@item1).to be_a Item
    end
    it 'returns the name of a product the store sells' do
      expect(@item1.name).to eq('Peach')
    end
    it 'returns the price of a product the store sells' do
      expect(@item1.price).to eq('$0.75')
    end
  end
end