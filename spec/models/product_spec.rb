require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before do
      @category = Category.new(:name => 'Flowers')
    end

    let (:product) { Product.new(:name => 'Tulip', :price_cents => 19.99, :quantity => 14, :category => @category) }

    it 'returns an error when name is nil' do
      product.name = nil
      product.save
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

    it 'returns an error when price is nil' do
      product.price_cents = nil
      product.save
      expect(product.errors.full_messages).to include("Price can't be blank")
    end

    it 'returns an error when quantity is nil' do
      product.quantity = nil
      product.save
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end
    
    it 'returns an error when category is nil' do
      product.category = nil
      product.save
      expect(product.errors.full_messages).to include("Category must exist")
    end
  end
end
