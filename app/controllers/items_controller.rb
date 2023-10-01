class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :edit, :destroy]
  before_action :move_to_index, except: [:index]
  
  def index
    @items = Item.all
  end

  def new
    if user_signed_in?
      @item = Item.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
  end

  private

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
