class EpicenterController < ApplicationController
  def feed
    @followed_farmers = []
    Product.all.each do |product|
      if current_user.following.include?(product.user_id) || current_user.id == product.user_id
        @followed_farmers.push(product)
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
