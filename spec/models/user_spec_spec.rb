require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it "should create a product if all validations pass" do
      @user = User.new(first_name: "Jon", last_name: "Doe", email: "jondoe@email.com", password: "test1234", password_confirmation: "test1234")
      expect(@user.valid?).to be(true)
    end
  end
end
