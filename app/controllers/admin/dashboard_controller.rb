class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_USERNAME'], password: ENV['ADMIN_PASSWORD']
  
  def show
    @categories = Category.order(id: :asc).all
    @products = Product.all
  end
end
