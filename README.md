
##usersテーブル

|Column             |Type   |Options    |
|-------------------|-------|-----------|
| nickname          |string |null: false|
| email             |string |null: false|
| first_name        |string |null: false|
| last_name         |string |null: false|
| first_kana        |string |null: false|
| last_kana         |string |null: false|
| birthday          |string |null: false|

- has_many :items
- has_many :orders

##itemsテーブル

|Column             |Type       |Options                       |
|-------------------|-----------|------------------------------|
| user              |references |null: false, foreign_key: true|
| name              |string     |null: false                   |
| explanation       |text       |null: false                   |
| Category_id       |integer    |null: false                   | 
| situation_id      |integer    |null: false                   |
| Shipping_charge_id|integer    |null: false                   |
| shipping_area_id  |integer    |null: false                   |
| shipping_days_id  |integer    |null: false                   |
| price             |integer    |null: false                   |

- has_many :orders
- belongs_to :user
- belongs_to :order

##ordersテーブル

|Column             |Type       |Options                       |
|-------------------|-----------|------------------------------|
| user              |references |null: false, foreign_key: true|
| item              |references |null: false, foreign_key: true|

- belongs_to :user
- belongs_to :item
- has_one :payments

##paymentsテーブル

|Column             |Type       |Options                       |
|-------------------|-----------|------------------------------|
| order             |references |null: false, foreign_key: true|
| postal_code       |string     |null: false                   |
|  shipping_area_id |integer    |null: false                   |
| city              |string     |null: false                   | 
| house_number      |string     |null: false                   |
| building_name     |string     |                              |
| telephone_number  |string     |null: false                   |

- belongs_to orderテーブル

