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

- has_many :items
- has_many :transactions, through: :user_transaction


## Items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| info                | text       | null: false                    |
| category            | integer    | null: false                    |
| sales_status        | integer    | null: false                    |
| shipping_fee_status | integer    | null: false                    |
| prefecture          | integer    | null: false                    |
| scheduled_delivery  | integer    | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :transaction


## Transactions テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| buyer      | references | null: false, foreign_key: true |
| seller     | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### Association

- has_one :item
- has_many :users, through: :user_transactions
- has_one :send_address


## Send_addresses テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postial_code | string     | null: false                    |
| prefecture   | integer    | null: false                    |
| city         | string     | null: false                    |
| addresses    | string     | null: false                    |
| building     | string     |                                |
| phone_number | string     | null: false                    |
| transaction  | references | null: false, foreign_key: true |

### Association

- has_one :transaction
