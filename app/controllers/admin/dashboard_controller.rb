class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with :name => ENV['ADMIN_USER'], :password => ENV['ADMIN_PASS'] 

  def show
    @product_count = Product.count
    @category_count = Product.distinct.count(:category_id)
  end
  
end
