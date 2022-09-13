require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it "should create a user if all validations pass" do
      @user = User.new(first_name: "Jon", last_name: "Doe", email: "jondoe@email.com", password: "test1234", password_confirmation: "test1234")
      expect(@user.valid?).to be(true)
    end

    it "should not create a user password is missing" do
      @user = User.new(first_name: "Jon", last_name: "Doe", email: "jondoe@email.com", password_confirmation: "test1234")
      @user.valid?
      expect(@user.errors[:password]).to include("can't be blank")
    end

    it "should not create a user password confirmation does not match" do
      @user = User.new(first_name: "Jon", last_name: "Doe", email: "jondoe@email.com", password: "test1234", password_confirmation: "test4321")
      @user.valid?
      expect(@user.errors[:password_confirmation]).to include("doesn\'t match Password")
    end
  end
end
