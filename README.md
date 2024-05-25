# README

## usersテーブル 

| Column       | Type    | Options                    |
| ------------ | ------- | -------------------------- |
| nickname     | string  | null: false                |
| email        | string  | null: false , unique: true |
| sei          | string  | null: false                |
| mei          | string  | null: false                |
| kana_sei     | string  | null: false                |
| kana_mei     | string  | null: false                |
| birthday     | date    | null: false                |

### Association

- has_many :products
- has_one :destinations

## productsテーブル

| Column        | Type      | Options                    |
| ------------- | --------- | -------------------------- |
| user_id       | reference | foreign_key: true          |
| product_name  | string    | null: false                |
| explanation   | text      | null: false                |
| price         | integer   | null: false                |
| genre_id      | string    | null: false                |
| shipping_cost | integer   | null: false                |
| prefecture_id | string    | null: false                |
| shipping_days | string    | null: false                |

### Association

- belongs_to :users
- has_one :orders 

## destinationsテーブル

| Column         | Type      | Options                         |
| -------------- | --------- | ------------------------------- |
| user_id        | reference | null: false , foreign_key: true |
| postal_code    | string    | null: false , unique: true      |
| prefecture     | string    | null: false                     |
| city           | string    | null: false                     |
| street_address | string    | null: false                     |
| building_name  | string    |                                 |
| phone_number   | string    | null:false                      | 

### Association

- belongs_to :users

##  ordersテーブル

| Column         | Type      | Options                         |
| -------------- | --------- | ------------------------------- |
| user_id        | reference | null: false , foreign_key: true |
| product_id     | reference | null: false , foreign_key: true |

### Association

- belongs_to :products
- belongs_to :users