require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'Should validate a fully qualified product' do 
      @category = Category.new()
      @product = Product.new(name: "Shirt", price: 100, quantity: 50, category: @category)
      @product.save!
    end
    it 'Should fail with nil name' do
      @category = Category.new()
      @product = Product.new(name: nil, price: 100, quantity: 50, category: @category)
      @product.save!
    end
    it 'Should fail with nil price' do
      @category = Category.new()
      @product = Product.new(name: "shirt", price: nil, quantity: 50, category: @category)
      @product.save!
    end
    it 'Should fail with nil quantity' do
      @category = Category.new()
      @product = Product.new(name: "shirt", price: 100, quantity: nil, category: @category)
      @product.save!
    end
    it 'Should fail with nil category' do
      @category = Category.new()
      @product = Product.new(name: "shirt", price: 100, quantity: 50, category: nil)
      @product.save!
      #@product.errors.full_messages
    end
  end
end
