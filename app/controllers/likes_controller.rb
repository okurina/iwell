class LikesController < ApplicationController
  before_action :set_chat

  def create
    like = current_user.likes.build(chat_id: params[:chat_id])
    like.save
    respond_to do |format|
      format.js
    end
  end

  def destroy
    like = Like.find(chat_id: params[:chat_id], user_id: current_user.id)
    like.destroy
    respond_to do |format|
      format.js
    end
  end

  def set_chat
    @chat = Chat.find(params[:chat_id])
  end

end
