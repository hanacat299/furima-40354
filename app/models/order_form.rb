calss OrderForm
include ActiveModel::Model
aftr_accessor :user, :product, :postal_code, :prefecture_id, :city, :street_address, :buliding_name, :phone_number

validates :user,          presence: true
validates :product,       presence: true
validates :postal_code,   presence: true, format: {with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)" }
validates :prefecture_id, numericality: { other_than: 1, message: "must be other than 1" }
validates :city,          presence: true
validates :street_address,presence: true
validates :phone_number,  presence: true, format: { with: /\A\d{10,11}\z/,message: "is invalid. Include hyphen(-)"}

def save
  order = Oreder.create(user_id: user.id, product_id: product.id)
  Destination.create(
    order_id: order_id,
    postal_code: postal_code,
    prefecture_id: prefecture_id,
    city: city,
    street_address: street_address,
    buliding_name: buliding_name,
    phone_number: phone_number
  )
end

end