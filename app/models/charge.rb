class Charge < ActiveHash::Base
  self.data = [
    { id: 1, item_name: '---' },
    { id: 2, item_name: '着払い(購入者負担)' },
    { id: 3, item_name: '送料込み(出品者負担)' },
  ]

  include ActiveHash::Associations
  has_many :items

  end