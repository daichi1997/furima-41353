class Condition < ActiveHash::Base
  self.data = [
    { id: 1, item_name: '---' },
    { id: 2, item_name: '新品・未使用' },
    { id: 3, item_name: '未使用に近い' },
    { id: 4, item_name: '目立った傷や汚れなし' },
    { id: 5, item_name: 'やや傷や汚れあり' },
    { id: 6, item_name: '傷や汚れあり' },
    { id: 7, item_name: '全体的に状態が悪い' }
  ]

  include ActiveHash::Associations
  has_many :items
end
