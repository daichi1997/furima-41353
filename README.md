## usersテーブル

| Column             | Type    | Options     |
| ------------------ | ------  | ----------- |
| nickname               | string  | null: false |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false |
| name               | string  | null: false |
| name_kana          | string  | null: false |
| birthday           | string  | null: false |

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
| prefectures_id     | integer   | null: false |
| date_id            | integer   | null: false |

### Association

- belongs_to :user
- has_one    :orders

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
| order              | references| null: false, foreign_key: true |
| postal_code        | string    | null: false |
| prefectures_id     | integer   | null: false |
| city               | string    | null: false |
| address_line1:     | string    | null: false |
| address_line2:     | string    |              
| phone_number       | string    | null: false |

### Association

- belongs_to :order
