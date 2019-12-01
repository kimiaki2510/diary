class LikesController < ApplicationController

  def create
    @like = Like.new(user_id: @current_user.id, record_id: params[:record_id])
    @like.save
    @record = Record.find_by(id: @like.record_id)
    @like_count = Like.where(record_id: params[:record_id]).count
  end

  def delete
    @like = Like.find_by(user_id: @current_user.id, record_id: params[:record_id])
    #@record = Record.find_by(id: @like.record_id)
    @like.destroy
    @like_count = Like.where(record_id: params[:record_id]).count
  end
end
