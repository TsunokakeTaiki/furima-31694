# テーブル設計

## Users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| first_name         | string  | null: false |
| last_name          | string  | null: false |
| first_name_kana    | string  | null: false |
| last_name_kana     | string  | null: false |
| user_birth_date    | date    | null: false |

### Association

- has_many :Items
- has_many :Transaction, through: :User_Transaction


## Items テーブル

| Column                   | Type    | Options     |
| ------------------------ | ------- | ----------- |
| name                     | string  | null: false |
| info                     | text    | null: false |
| item_category            | string  | null: false |
| item_sales_status        | string  | null: false |
| item_shipping_fee-status | string  | null: false |
| item_prefecture          | string  | null: false |
| item_scheduled_delivery  | string  | null: false |
| item_price               | integer | null: false |

### Association

- belongs_to :Users
- has_one :Transactions


## Transactions テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| buyer      | references | null: false, foreign_key: true |
| seller     | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### Association

- has_one :Items
- has_many :Users, through: :User_Transactions
- has_one :Send_addresses


## Send_addresses テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| postial_code | integer | null: false |
| prefecture   | string  | null: false |
| city         | string  | null: false |
| addresses    | string  | null: false |
| building     | string  |             |
| phone_number | integer | null: false |

### Association

- has_one :Transactions
