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
      expect(@user.errors.full_messages).to include("ニックネームを入力してください")
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end

    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
    end

    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Eメールは不正な値です')
    end

    it 'passwoldが空だと登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end

    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end

    it 'passwordが5文字以下だと登録できない' do
      @user.password = 'a2345'
      @user.password_confirmation = 'a2345'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
    end

    it 'passwordが英数字がないと登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは不正な値です')
    end

    it '英字のみのパスワードでは登録できない' do
      @user.password = 'yuuki'
      @user.password_confirmation = 'yuuki'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは不正な値です')
    end

    it '全角文字を含むパスワードは登録できない' do
      @user.password = 'ゆうき1a'
      @user.password_confirmation = 'ゆうき1a'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは不正な値です')
    end

    it '数字のみのパスワードでは登録できない' do
      @user.password = '55555'
      @user.password_confirmation = '55555'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは不正な値です')
    end

    it '名字が空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名字を入力してください")
    end

    it '名前が空だと登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名前を入力してください")
    end

    it '名字のふりがな全角カタカナが空では登録できない' do
      @user.last_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名字(カナ)を入力してください")
    end

    it '名前のふりがなが全角カタカナが空では登録できない' do
      @user.first_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名前(カナ)を入力してください")
    end

    it '名字が全角かな、カナ、漢字でないと登録できない' do
      @user.last_name = 'tanaka'
      @user.valid?
      expect(@user.errors.full_messages).to include('名字は不正な値です')
    end

    it '名前が全角かな、カナ、漢字でないと登録できない' do
      @user.first_name = 'yuuki'
      @user.valid?
      expect(@user.errors.full_messages).to include('名前は不正な値です')
    end

    it '名字のふりがなが全角カタカナでないと登録できない' do
      @user.last_kana = 'たなか'
      @user.valid?
      expect(@user.errors.full_messages).to include('名字(カナ)は不正な値です')
    end
    it '名前のふりがなが全角カタカナでないと登録できない' do
      @user.first_kana = 'ゆうき'
      @user.valid?
      expect(@user.errors.full_messages).to include('名前(カナ)は不正な値です')
    end

    it '生年月日がないと登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("生年月日を入力してください")
    end
  end
end
