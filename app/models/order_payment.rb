class OrderPayment
 Include ActiveModel::Model
  attr_accessor :postal_code, :shipping_area_id, :city, :house_number, :building_name, :telephone_number, :user_id, :item_id

  with_options presence: true do
    user_id
    item_id
    
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :shipping_area_id, numericality: { other_than: 1 }
    validates :city
    validates :house_number
    validates :telephone_number, format: {with:/\A[0-9]{11}\z/ }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    Payment.create(user_id: user_id, postal_code: postal_code, shipping_area_id: shipping_area_id, city: city, house_number: house_number, building_name: building_name, telephone_number: telephone_number,)
  
  end

end