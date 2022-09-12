require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "Validations" do
    # validation test/examples here
    it "should create a product" do
      @category = Category.new(name: "testCategory")
      @product = Product.new(name: "testProduct", price: 99, quantity: 10, category: @category)
      expect(@product.errors).not_to include("can't be blank")
    end
  end
end
