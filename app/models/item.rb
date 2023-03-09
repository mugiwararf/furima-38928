class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  #  テーブル
  belongs_to       :user
  has_one          :order
  has_one_attached :image
  #  active hush
  belongs_to :category
  belongs_to :situation
  belongs_to :shipping_charge
  belongs_to :shipping_area
  belongs_to :shipping_day

  with_options presence: true do
    validates :name
    validates :explanation
    validates :category_id
    validates :shipping_charge_id
    validates :shipping_area_id
    validates :shipping_day_id
    validates :price,
              numericality: {allow_blank: true, only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :image
  end
  # active hush
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :situation_id
    validates :shipping_charge_id
    validates :shipping_area_id
    validates :shipping_day_id
  end
end
