class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, except: [:index]
  
  def index
    @items = Item.order('created_at DESC')
  end

  def new
    if user_signed_in?
      @item = Item.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @qr_code = generate_qr_code(@item)
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def search
    @items = Item.search(params[:keyword])
  end

  def print_qr_code
    @item = Item.find(params[:id])
    @qr_code = generate_qr_code(@item)
  end

  private

  def item_params
    params.require(:item).permit(:category_id, :unit_id, :place_id, :expiry_date, :quantity, :price, :item_name, :order_code, 
                                 :comment, :qr_code, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def generate_qr_code(item)
    size = 10
  
    edit_url = edit_item_url(item)
    qr_data = "Item ID: #{item.id}\nEdit URL: #{edit_url}"
  
    qr = RQRCode::QRCode.new(qr_data, level: :h, size: size)
    png = qr.as_png(resize_gte_to: false, resize_exactly_to: false, fill: 'white', color: 'black', module_px_size: 6)
    "data:image/png;base64,#{Base64.strict_encode64(png.to_s)}"
  end

end
