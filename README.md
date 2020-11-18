# テーブル設計

## Users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| first-name         | string  | null: false |
| last-name          | string  | null: false |
| first-name-kana    | string  | null: false |
| last-name-kana     | string  | null: false |
| user_birth_date_1i | integer | null: false |
| user_birth_date_2i | integer | null: false |
| user_birth_date_3i | integer | null: false |

### Association

- has_many :Items
- has_many :Transaction, through: :User_Transaction


## Items テーブル

| Column                   | Type    | Options     |
| ------------------------ | ------- | ----------- |
| name                     | string  | null: false |
| info                     | text    | null: false |
| item-category            | string  | null: false |
| item-sales-status        | string  | null: false |
| item-shipping-fee-status | string  | null: false |
| item-prefecture          | string  | null: false |
| item-scheduled-delivery  | string  | null: false |
| item-price               | integer | null: false |

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
| postial-code | integer | null: false |
| prefecture   | string  | null: false |
| city         | string  | null: false |
| addresses    | string  | null: false |
| building     | string  |             |
| phone-number | integer | null: false |

### Association

- has_one :Transactions
