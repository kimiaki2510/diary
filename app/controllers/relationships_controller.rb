class RelationshipsController < ApplicationController
  before_action :require_user_logged_in

  def create
    user = User.find_by(params[:follow_id])
    current_user.follow(user)
    flash[:success] = 'フォローしました'
    redirect_to user
  end

  def destroy
    user = User.find(parmas[:follow_id])
    current_user.unfollow(user)
    flash[:success] = 'フォローを解除しました'
    redirect_to user
  end
end
