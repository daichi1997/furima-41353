class Category < ActiveHash::Base
  self.data = [
    { id: 1, item_name: '---' },
    { id: 2, item_name: 'レディース' },
    { id: 3, item_name: 'メンズ' },
    { id: 4, item_name: 'ベビー・キッズ' },
    { id: 5, item_name: 'インテリア・住まい・小物' },
    { id: 6, item_name: '本・音楽・ゲーム' },
    { id: 7, item_name: 'おもちゃ・ホビー・グッズ' },
    { id: 8, item_name: '家電・スマホ・カメラ' },
    { id: 9, item_name: 'スポーツ・レジャー' },
    { id: 10, item_name: 'ハンドメイド' },
    { id: 11, item_name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :items

  end