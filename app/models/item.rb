class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  def sold_out?
    order.present?
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :shipping_date

  validates :image, presence: true
  validates :item_name, presence: true
  validates :description,      presence: true
  validates :category_id,      numericality:  { other_than: 1, message: "can't be blank" }
  validates :condition_id,     numericality:  { other_than: 1, message: "can't be blank" }
  validates :charge_id,        numericality:  { other_than: 1, message: "can't be blank" }
  validates :prefecture_id,    numericality:  { other_than: 1, message: "can't be blank" }
  validates :shipping_date_id, numericality:  { other_than: 1, message: "can't be blank" }
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
