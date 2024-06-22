class OrderForm
include ActiveModel::Model
attr_accessor :user_id, :product_id, :postal_code, :prefecture_id, :city, :street_address, :building_name, :phone_number

validates :postal_code,   presence: true, format: {with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)" }
validates :prefecture_id, numericality: { other_than: 1, message: "must be other than 1" }
validates :city,          presence: true
validates :street_address,presence: true
validates :phone_number,  presence: true, format: { with: /\A\d{10,11}\z/,message: "is invalid. Include hyphen(-)"}

def save
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
end

end
