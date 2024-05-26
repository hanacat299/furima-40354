# README

## usersテーブル 

| Column       | Type    | Options                    |
| ------------ | ------- | -------------------------- |
| nickname     | string  | null: false                |
| email        | string  | null: false , unique: true |
| password     | string  | null: false                |
| sei          | string  | null: false                |
| mei          | string  | null: false                |
| kana_sei     | string  | null: false                |
| kana_mei     | string  | null: false                |
| birthday     | date    | null: false                |

### Association

- has_many :products
- has_one :order

## productsテーブル

| Column           | Type       | Options                   　b  |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| product_name     | string     | null: false                    |
| explanation      | text       | null: false                    |
| price            | integer    | null: false                    |
| genre_id         | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| shipping_cost_id | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| shipping_day_id  | integer    | null: false                    |

### Association

- belongs_to :user
- has_one :order

## destinationsテーブル

| Column         | Type       | Options                         |
| -------------- | ---------- | ------------------------------- |
| postal_code    | string     | null: false                     |
| prefecture_id  | integer    | null: false                     |
| city           | string     | null: false                     |
| street_address | string     | null: false                     |
| building_name  | string     |                                 |
| phone_number   | string     | null: false                     |
| order          | references | null: false , foreign_key: true |

### Association

- belongs_to :order

##  ordersテーブル

| Column         | Type       | Options                         |
| -------------- | ---------- | ------------------------------- |
| user           | references | null: false , foreign_key: true |
| product        | references | null: false , foreign_key: true |

### Association

- belongs_to :product
- belongs_to :user
- has_one :destination