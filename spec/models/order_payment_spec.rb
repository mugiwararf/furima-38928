require 'rails_helper'

RSpec.describe OrderPayment, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_payment = FactoryBot.build(:order_payment, user_id: @user.id, item_id: @item.id)
  end

  describe '購入者の配送登録ができるとき' do
    context '配送登録ができるとき' do
      it '正しく記入できていてば登録できる' do
        expect(@order_payment).to be_valid
      end
    it '建物名が空でも登録できる' do
      @order_payment.building_name = ''
      expect(@order_payment).to be_valid
    end
    end
  end

  context '配送登録ができないとき' do
    it 'user_idが空だと登録できない' do
      @order_payment.user_id = nil
      @order_payment.valid?
      expect(@order_payment.errors.full_messages).to include("User can't be blank")
    end

    it 'item_idが空だと登録できない' do
      @order_payment.item_id = nil
      @order_payment.valid?
      expect(@order_payment.errors.full_messages).to include("Item can't be blank")
    end

    it '郵便番号が空では登録できない' do
      @order_payment.postal_code = ''
      @order_payment.valid?
      expect(@order_payment.errors.full_messages).to include("Postal code can't be blank")
    end

    it '発送先の地域が空では登録できない' do
      @order_payment.shipping_area_id = 1
      @order_payment.valid?
      expect(@order_payment.errors.full_messages).to include('Shipping area must be other than 1')
    end

    it '市区町村が空だと登録できない' do
      @order_payment.city = ''
      @order_payment.valid?
      expect(@order_payment.errors.full_messages).to include("City can't be blank")
    end

    it '番地が空だと登録できない' do
      @order_payment.house_number = ''
      @order_payment.valid?
      expect(@order_payment.errors.full_messages).to include("House number can't be blank")
    end

    it '電話番号が空だと登録できない' do
      @order_payment.telephone_number = ''
      @order_payment.valid?
      expect(@order_payment.errors.full_messages).to include("Telephone number can't be blank")
    end
    
    it '電話番号が10以下だと登録できない' do
      @order_payment.telephone_number = '090123456'
      @order_payment.valid?
      expect(@order_payment.errors.full_messages).to include("Telephone number is invalid")
    end


    it '電話番号が11以上だと登録できない' do
      @order_payment.telephone_number = '090123456789'
      @order_payment.valid?
      expect(@order_payment.errors.full_messages).to include('Telephone number is invalid')
    end

    it '電話番号にハイフンがあると登録できない' do
      @order_payment.telephone_number = '090-1234-5678'
      @order_payment.valid?
      expect(@order_payment.errors.full_messages).to include('Telephone number is invalid')
    end

    it 'tokenが空では登録できない' do
      @order_payment.token = nil
      @order_payment.valid?
      expect(@order_payment.errors.full_messages).to include("Token can't be blank")
    end
  end
end
