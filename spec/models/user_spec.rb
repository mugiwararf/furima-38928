require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

 describe 'ユーザー新規登録'
    context '新規登録できるとき' do
  it '全ての記入欄を正しく入力すれば登録できる' do
    expect(@user).to be_valid
  end
end


    context '新規登録できない時' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwoldが空だと登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it  'passwordが5文字以下だと登録できない' do
      @user.password = 'a2345'
      @user.password_confirmation = 'a2345' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    
    it 'passwordが英数字がないと登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end
  
    it '名字が全角かな、カナ、漢字でないと登録できない' do
      @user.last_name = 'tanaka'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end
    
     it '名前が全角かな、カナ、漢字でないと登録できない' do
      @user.first_name = 'yuuki'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
     end
  
     it '名字のふりがなが全角カタカナでないと登録できない' do
     @user.last_kana = 'たなか'
     @user.valid?
      expect(@user.errors.full_messages).to include("Last kana is invalid")
     end
     it '名前のふりがなが全角カタカナでないと登録できない' do
      @user.first_kana = 'ゆうき'
      @user.valid?
      expect(@user.errors.full_messages).to include("First kana is invalid")
      end

      it '生年月日がないと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      
    
    end
end