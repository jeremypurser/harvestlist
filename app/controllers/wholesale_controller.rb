class WholesaleController < ApplicationController
  def all_products
    @products = Product.all
  end

  def products_by_category
    @category = Category.find(params[:category_id])
    @categories = Category.all
    @products = Product.where(category_id: params[:category_id])
  end

  def products_by_vendor
    @vendor = User.find(params[:user_id])
    @products = Product.where(user_id: params[:user_id])
  end
end
