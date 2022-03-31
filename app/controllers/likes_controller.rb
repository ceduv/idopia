require 'pry'
class LikesController < ApplicationController

  def create
    if already_like?
      flash[:notice] = "You can't like more than once"
    else
      @like = Like.new
      @like.post_id = params[:post_id]
      @like.user_id = current_user.id
      @like.emoji_id = params[:emoji_id]
      redirect_to root_path if @like.save
    end
  end

  def destroy
    @like = Like.find_by('user_id= ? AND post_id= ? AND emoji_id= ?', current_user.id, params[:post_id], params[:emoji_id])
    @like.destroy
    redirect_to root_path
  end

  private

  def already_like?
    Like.where(user_id: current_user.id, post_id: params[:post_id], emoji_id: params[:emoji_id]).exists?
  end
end
