## usersテーブル

| Column             | Type    | Options     |
| ------------------ | ------  | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false |
| last_name          | string  | null: false |
| last_name_kana     | string  | null: false |
| first_name         | string  | null: false |
| first_name_kana    | string  | null: false |
| birthday           | date    | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column             | Type      | Options     |
| ------------------ | ------    | ----------- |
| user               | references| null: false, foreign_key: true |
| item_name          | string    | null: false |
| description        | text      | null: false |
| price              | integer   | null: false |
| category_id        | integer   | null: false |
| condition_id       | integer   | null: false |
| charge_id          | integer   | null: false |
| prefecture_id      | integer   | null: false |
| shipping_date_id   | integer   | null: false |

### Association

- belongs_to :user
- has_one    :order

## orders テーブル

| Column | Type       | Options    |
| ------ | ---------- | ---------- |
| user                | references | null: false, foreign_key: true |
| item                | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one    :shipping_add

## shipping_add テーブル

| Column             | Type      | Options     |
| ------------------ | ------    | ----------- |
| order              | references| null: false, foreign_key: true |
| postal_code        | string    | null: false |
| prefecture_id      | integer   | null: false |
| city               | string    | null: false |
| address_line_main  | string    | null: false |
| address_line_sub   | string    |              
| phone_number       | string    | null: false |

### Association

- belongs_to :order
