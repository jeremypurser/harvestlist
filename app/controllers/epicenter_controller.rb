class EpicenterController < ApplicationController
  def feed
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
