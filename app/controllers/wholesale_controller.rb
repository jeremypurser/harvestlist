class WholesaleController < ApplicationController
  def all_products
    @products = Product.all
  end

  def products_by_category

  end

  def products_by_vendor
    @vendor = User.find(params[:user_id])
    @products = Product.where(user_id: params[:user_id])
  end
end
