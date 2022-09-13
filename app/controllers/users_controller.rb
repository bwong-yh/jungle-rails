class UsersController < ApplicationController
  before_action { flash.clear }
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    @duplicate_email = User.all.find_index do |u|
      u.email.downcase == @user.email.downcase
    end

    if @duplicate_email != nil
      flash[:alert] = "Email has already been taken"
      render :new
    elsif @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else 
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation)
  end
end
