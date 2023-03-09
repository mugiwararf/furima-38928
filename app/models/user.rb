class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  with_options presence: true do
    validates :nickname
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶー-龥々]+\z/ }
    validates :last_name,  format: { with: /\A[ぁ-んァ-ヶー-龥々]+\z/ }
    # カタカナ
    validates :first_kana, format: { with: /\A[ァ-ヶー－]+\z/  }
    validates :last_kana,  format: { with: /\A[ァ-ヶー－]+\z/  }
    validates :birthday
  end
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX
end
