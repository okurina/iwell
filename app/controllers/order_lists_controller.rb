class OrderListsController < ApplicationController
  before_action :set_list

  def index
    @order_list_items = current_user.order_lists.map(&:item)
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

  def remove_from_list
    order_list = OrderList.find_by(item_id: params[:item_id], user_id: current_user.id)
    order_list.destroy
    respond_to do |format|
      format.js
    end
  end

  def set_list
    @item = Item.find_by(id: params[:item_id])
  end
end
