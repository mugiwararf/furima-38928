require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品登録' do
    context '出品登録ができるとき' do
      it '全ての記入欄を正しく入力すれば出品できる' do
        expect(@item).to be_valid
      end
    end
  end

  context '出品登録ができないとき' do
    it '画像が空だと登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("画像を入力してください")
    end
    it 'userが紐付いてないと出品できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Userを入力してください')
    end
    it '商品名が空だと登録できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("商品名を入力してください")
    end

    it '商品説明が空だと登録できない' do
      @item.explanation = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の説明を入力してください")
    end

    it 'カテゴリが空だと登録できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('カテゴリーは1以外の値にしてください')
    end

    it '商品の状態が空だと登録できない' do
      @item.situation_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('商品の状態は1以外の値にしてください')
    end

    it '配送料の負担が空だと登録できない' do
      @item.shipping_charge_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('配送料の負担は1以外の値にしてください')
    end

    it '発送元の地域が空では登録できない' do
      @item.shipping_area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('配送先の地域は1以外の値にしてください')
    end

    it '発送までの日数が空では登録できない' do
      @item.shipping_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('発送までの日数は1以外の値にしてください')
    end

    it '価格が空だと登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("金額を入力してください")
    end

    it '価格が３００円以下だと登録できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('金額は300以上の値にしてください')
    end

    it '価格が9999999円以上だと登録できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('金額は9999999以下の値にしてください')
    end

    it '価格に半角数字以外が含まれている場合は出品できない' do
      @item.price = 'a1'
      @item.valid?
      expect(@item.errors.full_messages).to include('金額は数値で入力してください')
    end
  end
end
