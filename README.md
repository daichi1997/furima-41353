## usersテーブル

| Column             | Type    | Options     |
| ------------------ | ------  | ----------- |
| name               | string  | null: false |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false |
| phone_number       | integer | null: false |
| address            | string  | null: false |

### Association

- has_many :items
- has_many :orders
- has_many :shipping_add

## items テーブル

| Column             | Type      | Options     |
| ------------------ | ------    | ----------- |
| user_id            | string    | null: false, foreign_key: true |
| item_name          | string    | null: false |
| description        | text      | null: false |
| price              | integer   | null: false |
| category           | text      | null: false |
| condition          | text      | null: false |
| stock              | integer   | null: false |

### Association

- belongs_to :user
- has_many   :orders

## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user_id             | string    | null: false, foreign_key: true |
| item_id             | string    | null: false, foreign_key: true |
| quantity            | integer   | null: false |
| total_price         | integer   | null: false |
| status              | string    | null: false |

### Association

- belongs_to :items
- belongs_to :user
- has_one    :shipping_add

## shipping_add テーブル

| Column             | Type      | Options     |
| ------------------ | ------    | ----------- |
| user_id            | string    | null: false, foreign_key: true |
| order_id           | string    | null: false, foreign_key: true |
| recipient_name     | string    | null: false |
| address_line1:     | string    | null: false |
| address_line2:     | string    |              
| state              | string    | null: false |
| city               | string    | null: false |
| postal_code        | integer   | null: false |
| phone_number       | integer   | null: false |

### Association

- belongs_to :order
- belongs_to :user