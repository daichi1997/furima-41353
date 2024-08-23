class OrderAdd
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address_line_main, :address_line_sub, :phone_number,
                :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :address_line_main
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid.' }
    validates :token
    validates :user_id
    validates :item_id
  end

  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(user_id:, item_id:)
    ShippingAdd.create(
      postal_code:,
      prefecture_id:,
      city:,
      address_line_main:,
      address_line_sub:,
      phone_number:,
      order_id: order.id
    )
  end
end
