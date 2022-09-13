require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it "should create a user if all validations pass" do
      @user = User.new(first_name: "John", last_name: "Smith", email: "johnsmith@email.com", password: "test1234", password_confirmation: "test1234")
      expect(@user.valid?).to be(true)
    end

    it "should not create a user if first name is missing" do
      @user = User.new(last_name: "Smith", email: "johnsmith@email.com",password_confirmation: "test1234")
      @user.valid?
      expect(@user.errors[:first_name]).to include("can't be blank")
    end

    it "should not create a user if last name is missing" do
      @user = User.new(first_name: "John", email: "johnsmith@email.com",password_confirmation: "test1234")
      @user.valid?
      expect(@user.errors[:last_name]).to include("can't be blank")
    end

    it "should not create a user if email is missing" do
      @user = User.new(first_name: "John", last_name: "Smith", password_confirmation: "test1234")
      @user.valid?
      expect(@user.errors[:email]).to include("can't be blank")
    end

    it "should not create a user if email is not unique (email already taken)" do
      @user1 = User.new(first_name: "John", last_name: "Smith", email: "johnsmith@email.com", password: "test1234", password_confirmation: "test1234")
      @user1.save
      @user2 = User.new(first_name: "John", last_name: "Smith", email: "JohnSmith@email.com", password: "test4321", password_confirmation: "test4321")
      @user2.valid?
      expect(@user2.errors[:email]).to include("has already been taken")
    end

    it "should not create a user if password is missing" do
      @user = User.new(first_name: "John", last_name: "Smith", email: "johnsmith@email.com", password_confirmation: "test1234")
      @user.valid?
      expect(@user.errors[:password]).to include("can't be blank")
    end

    it "should not create a user if password is too short (less than 6 characters)" do
      @user = User.new(first_name: "John", last_name: "Smith", email: "johnsmith@email.com", password: "1234", password_confirmation: "1234")
      @user.valid?
      expect(@user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end

    it "should not create a user if password confirmation does not match" do
      @user = User.new(first_name: "John", last_name: "Smith", email: "johnsmith@email.com", password: "test1234", password_confirmation: "test4321")
      @user.valid?
      expect(@user.errors[:password_confirmation]).to include("doesn\'t match Password")
    end
  end
end
