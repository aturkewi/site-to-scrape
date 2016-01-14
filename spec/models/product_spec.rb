require 'spec_helper'
RSpec.describe Product do
  context 'there is a product in the database' do
    Product.create(name:'Kitchen sink', sku:123456789, price:10)
    describe 'has all properties' do
      it 'has a name' do
        expect(Product.first.name).to eq('Kitchen sink')
      end
      it 'has a sku' do
        expect(Product.first.sku).to eq(123456789)
      end
    end
  end
end
