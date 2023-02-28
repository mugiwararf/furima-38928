class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname,   presence: true
         with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
          validates :first_name
          validates :last_name
        end
         validates :first_kana, presence: true, format: { with: /[\p{katakana} ー－&&[^ -~｡-ﾟ]]+/, message: '全角カタカナのみで入力して下さい' }
         validates :last_kana,  presence: true, format: { with: /[\p{katakana} ー－&&[^ -~｡-ﾟ]]+/, message: '全角カタカナのみで入力して下さい' }
         validates :date,       presence: true
         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 


end
