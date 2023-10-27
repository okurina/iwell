require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user: user)
  end

  describe 'アイテムデータの保存' do
    context 'アイテムデータが保存される場合' do
      it 'item_name、category_id、place_id、quantity、unit_idが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品データが保存されない場合' do
      it 'item_nameが空では保存できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item nameを入力してください")
      end
      it 'category_idを選択していないと保存できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Categoryを選択してください")
      end
      it 'category_idで「1」を選択していると保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Categoryを選択してください")
      end
      it 'place_idを選択していないと保存できない' do
        @item.place_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Placeを選択してください")
      end
      it 'place_idで「1」を選択していると保存できない' do
        @item.place_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Placeを選択してください")
      end
      it 'quantityが空では保存できない' do
        @item.quantity = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Quantityを入力してください")
      end
      it 'quantityは半角数字でないと保存できない' do
          @item.quantity = '１２３４５６'
          @item.valid?
          expect(@item.errors.full_messages).to include('Quantityには半角数字を使用してください')
      end
      it 'unit_idを選択していないと保存できない' do
        @item.unit_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Unitを選択してください")
      end
      it 'unit_idで「1」を選択していると保存できない' do
        @item.unit_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Unitを選択してください")
      end
      it 'priceは半角数字でないと保存できない' do
        @item.price = '１２３４５６'
        @item.valid?
        expect(@item.errors.full_messages).to include('Priceには半角数字を使用してください')
      end
    end
  end
end

