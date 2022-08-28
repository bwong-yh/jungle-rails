class UsersController < ApplicationController
  before_action { flash.clear }
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    @duplicate_email = User.all.filter do |u|
      u.email == @user.email
    end

    if @duplicate_email.length > 0
      flash[:alert] = "Email already registered."
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
