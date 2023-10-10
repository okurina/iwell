class ChatsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :destroy]
  
  def index
    @chat = Chat.new
    @chats = Chat.includes(:user).order('created_at DESC')
  end

  def create
    @chat = Chat.new(chat_params)
    @chat.save
    redirect_to chats_path
  end

  def edit
  end

  def update
    if @chat.update(chat_params)
      redirect_to chats_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @chat.destroy
    redirect_to chats_path
  end

  private

  def chat_params
    params.require(:chat).permit(:message, :image).merge(user_id: current_user.id)
  end

  def set_item
    @chat = Chat.find(params[:id])
  end

end
