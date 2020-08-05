# テーブル設計

## usersテーブル

| column           | type        | options                     |
| ---------------- | ----------- | --------------------------- |
| name             | string      | null: false                 |
| email            | string      | null: false                 |
| password         | string      | null: false                 |
| family_name      | string      | null: false                 |
| last_name        | string      | null: false                 |
| family_name_kana | string      | null: false                 |
| last_name_kana   | string      | null: false                 |
| birth_year       | integer     | null: false                 |
| birth_month      | integer     | null: false                 |
| birth_day        | integer     | null: false                 |

### Association

- has_many :items
- has_one :buyers


## itemsテーブル

| column           | type         | options                         |
| ---------------- | ------------ | ------------------------------- |
| image            | text         | null: false                     |
| name             | string       | null: false                     |
| text             | text         | null: false                     |
| price            | integer      | null: false                     |
| user             | references   | null: false, foreign_key: true  |
| category         | references   | null: false, foreign_key: true  |
| status           | references   | null: false, foreign_key: true  |
| shipping_charge  | references   | null: false, foreign_key: true  |
| delivery_area    | references   | null: false, foreign_kew: true  |
| delivery_date    | references   | null: false, foreign_key: true  |

### Association

- belongs_to :user
- has_one :buyer
- belongs_to_active_hash :category
- belongs_to_active_hash :status
- belongs_to_active_hash :shipping_charge 
- belongs_to_active_hash :delivery_area
- belongs_to_active_hash :delivery_date


## buyersテーブル

| column   | type       | options                        |
| -------- | ------     | ------------------------------ |
| user     | references | null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :item
has_one :card
has_one :shipping_address


## shipping_addressテーブル

| column        | type             | options                        |
| ------------- | ---------------- | ------------------------------ |
| buyer         | references       | null: false, foreign_key: true |
| postal_code   | integer          | null: false                    |
| prefecture    | references       | null: false, foreign_key: true |
| city          | string           | null: false                    |
| city_address  | string           | null: false                    |
| building_name | string           |                                |
| phone_number  | integer          | null: false                    |


### Association

belongs_to :buyer


## cardテーブル

| column | type     | options      |
| ------ | -------- | ------------ |
| price  | integer  | null: false  |

### Association

belongs_to :buyer