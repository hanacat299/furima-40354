class OrderForm
include ActiveModel::Model
attr_accessor :user_id, :product_id, :postal_code, :prefecture_id, :city, :street_address, :building_name, :phone_number, :token

with_options presence: true do
validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)" }
validates :city        
validates :street_address
validates :phone_number, format: { with: /\A\d{10,11}\z/,message: "is invalid."}
validates :token   
validates :user_id
validates :product_id 
end   

validates :prefecture_id, numericality: { other_than: 1, message: "must be other than 1" }


def save
  if valid?
  order = Order.create(product_id: product_id, user_id: user_id)
  Destination.create(
    order_id: order.id,
    postal_code: postal_code,
    prefecture_id: prefecture_id,
    city: city,
    street_address: street_address,
    building_name: building_name,
    phone_number: phone_number
  )
    return true
  else
    return false
  end

end

end
