
##userテーブル

|Column             |Type   |Options    |
|-------------------|-------|-----------|
| nickname          |string |null: false|
| email             |string |null: false|
| passwold          |string |null: false|
| encrypted_password|string |null: false|
| fast_name         |string |null: false|
| last_name         |string |null: false|
| fast_kana         |string |null: false|
| last_kana         |string |null: false|
| birthday          |string |null: false|

- has_many :itemsテーブル
- has_many :ordersテーブル

##itemテーブル

|Column             |Type       |Options                       |
|-------------------|-----------|------------------------------|
| user              |references |null: false, foreign_key: true|
| name              |string     |null: false                   |
| explanation       |text       |null: false                   |
| Category          |integer    |null: false                   | 
| situation         |integer    |null: false                   |
| Shipping charge   |integer    |null: false                   |
| shipping area     |integer    |null: false                   |
| shipping days     |integer    |null: false                   |
| price             |integer    |null: false                   |

- has_many :ordersテーブル
- belongs_to :userテーブル
- belongs_to :orderテーブル

##orderテーブル

|Column             |Type       |Options                       |
|-------------------|-----------|------------------------------|
| user              |references |null: false, foreign_key: true|
| item              |references |null: false, foreign_key: true|

- belongs_to :userテーブル
- belongs_to :itemテーブル
- has_one :paymentsテーブル

##paymentsテーブル

|Column             |Type       |Options                       |
|-------------------|-----------|------------------------------|
| order             |references |null: false, foreign_key: true|
| postal_code       |string     |null: false                   |
| prefecture        |integer    |null: false                   |
| city              |string     |null: false                   | 
| house_number      |string     |null: false                   |
| building_name     |string     |null: false                   |
| telephone number  |string     |null: false                   |

- belongs_to orderテーブル

