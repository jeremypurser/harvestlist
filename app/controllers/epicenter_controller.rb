class EpicenterController < ApplicationController
  def feed
  end

  def show_user
  end

  def now_following
    current_user.following.push(params[:id].to_i)
    current_user.save
    redirect_to show_user_path(id: params[:id])
  end

  def unfollow
  end
end
