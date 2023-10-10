class LikesController < ApplicationController
  before_action :set_tweet

  def create
    like = current_user.likes.build(chat_id: params[:chat_id])
    like.save
    respond_to do |format|
      format.js
    end
  end

  def destroy
    like = Like.find_by(chat_id: params[:chat_id], user_id: current_user.id)
    like.destroy
    respond_to do |format|
      format.js
    end
  end

  def set_tweet
    @chat = Chat.find(params[:chat_id])
  end

end
