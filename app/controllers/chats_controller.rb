class ChatsController < ApplicationController
  
  def index
    @chat = Chat.new
    @chats = Chat.includes(:user)
  end

  def create
    @chat = Chat.new(chat_params)
    @chat.save
  end

  private

  def chat_params
    params.require(:chat).permit(:message, :image).merge(user_id: current_user.id)
  end
end
