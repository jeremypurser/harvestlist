class EpicenterController < ApplicationController
  
  def feed 
    if current_user
      create_feed
    else
      redirect_to store_path
    end
  end
  
  def create_feed
    @products = []
    Product.all.each do |product|
      if current_user.following.include?(product.user_id) || current_user.id == product.user_id
        @products.push(product)
      end
    end
  end

  def show_user
  end

  def now_following
    current_user.following.push(params[:id].to_i)
    current_user.save
    redirect_to vendors_path(user_id: params[:id])
  end

  def unfollow
    current_user.following.delete(params[:id].to_i)
    current_user.save
    redirect_to vendors_path(user_id: params[:id])  	
  end
end
