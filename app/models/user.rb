class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items


        
  validates :nickname, presence: true
  # ひらがな カナ 漢字
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶー-龥々]+\z/ }
  validates :last_name, presence: true,  format: { with: /\A[ぁ-んァ-ヶー-龥々]+\z/ }
  # カタカナ
  validates :first_kana,    presence: true, format: { with: /\A[ァ-ヶー－]+\z/  }
  validates :last_kana,     presence: true, format: { with: /\A[ァ-ヶー－]+\z/  }
  validates :birthday, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
end
