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
  expect(@item.errors.full_messages).to include("Image can't be blank")
 end


it '商品名が空だと登録できない' do
  @item.name = ''
  @item.valid?
 expect(@item.errors.full_messages).to include("Name can't be blank")
end

it '商品説明が空だと登録できない' do
  @item.explanation = ''
  @item.valid?
  expect(@item.errors.full_messages).to include("Explanation can't be blank")
end

it 'カテゴリが空だと登録できない' do
@item.category_id = 1
@item.valid?
expect(@item.errors.full_messages).to include("Category must be other than 1")
end

it '商品の状態が空だと登録できない' do
  @item.situation_id = 1
  @item.valid?
  expect(@item.errors.full_messages).to include("Situation must be other than 1")
end

it '配送料の負担が空だと登録できない' do
@item.shipping_charge_id = 1
@item.valid?
expect(@item.errors.full_messages).to include("Shipping charge must be other than 1")
end

it '発送元の地域が空では登録できない' do
  @item.shipping_area_id = 1
  @item.valid?
 expect(@item.errors.full_messages).to include("Shipping area must be other than 1")
end

it '発送までの日数が空では登録できない' do
  @item.shipping_day_id = 1
  @item.valid?
  expect(@item.errors.full_messages).to include("Shipping day must be other than 1")
end

it '価格が空だと登録できない' do
  @item.price = ''
  @item.valid?
  expect(@item.errors.full_messages).to include("Price can't be blank")
end

it '価格が３００円以下だと登録できない' do
  @item.price = 299
  @item.valid?
  expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
end

it '価格が9999999円以上だと登録できない' do
  @item.price = 10_000_000
  @item.valid?
  expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
end
end
end
