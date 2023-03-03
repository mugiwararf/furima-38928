class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :situation
  belongs_to :shipping_charge
  belongs_to :shipping_area
  belongs_to :shipping_day

  
  validates :name,               presence: true
  validates :explanation,        presence: true
  validates :category_id,        presence: true
  validates :situation_id,       presence: true
  validates :shipping_charge_id, presence: true
  validates :shipping_area_id,   presence: true
  validates :shipping_day_id,    presence: true
  validates :price,              presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}, format: { with: /\A[0-9]+\z/  }
  validates :image,              presence: true



  # active hush
  validates :category_id, numericality: { other_than: 1 } 
  validates :situation_id, numericality: { other_than: 1 } 
  validates :shipping_charge_id, numericality: { other_than: 1 } 
  validates :shipping_area_id, numericality: { other_than: 1 } 
  validates :shipping_day_id, numericality: { other_than: 1 } 


  
end
