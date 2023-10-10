class OrderListsController < ApplicationController
  before_action :set_list

  def index

  end

  def create
    order_list = current_user.order_lists.build(item_id: params[:item_id])
    order_list.save
    respond_to do |format|
      format.js
    end
  end

  def destroy
    order_list = OrderList.find_by(item_id: params[:item_id], user_id: current_user.id)
    order_list.destroy
    respond_to do |format|
      format.js
    end
  end

  def set_list
    @item = Item.find(params[:item_id])
  end
end
