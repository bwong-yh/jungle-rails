require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "Validations" do
    # validation test/examples here
    it "should create a product" do
      @category = Category.new(name: "testCategory")
      @product = Product.new(name: "testProduct", price: 99, quantity: 10, category: @category)
      expect(@product.valid?).to be(true)
    end

    it "should not create a product if product name is missing" do
      @category = Category.new(name: "testCategory")
      @product = Product.new(price: 99, quantity: 10, category: @category)
      @product.valid? # necessary ensure valid is false so value can be assigned to the error
      expect(@product.errors[:name]).to include("can't be blank")
    end

    it "should not create a product if product price is missing" do
      @category = Category.new(name: "testCategory")
      @product = Product.new(name: "testProduct", quantity: 10, category: @category)
      @product.valid?
      expect(@product.errors[:price]).to include("can't be blank")
    end
  end
end
