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
| birth_day        | date        | null: false                 |

### Association

- has_many :items
- has_one :buyer



## itemsテーブル

| column              | type         | options                         |
| ----------------    | ------------ | ------------------------------- |
| image               | text         | null: false                     |
| name                | string       | null: false                     |
| text                | text         | null: false                     |
| price               | integer      | null: false                     |
| category_id         | integer      | null: false                     |
| status_id           | integer      | null: false                     |
| shipping_charge_id  | integer      | null: false                     |
| delivery_area_id    | integer      | null: false                     |
| delivery_date_id    | integer      | null: false                     |
| user                | references   | null: false, foreign_key: true  |

### Association

- belongs_to :user
- has_one :shipping_address
- has_one :buyer
- belongs_to_active_hash :category
- belongs_to_active_hash :status
- belongs_to_active_hash :shipping_charge 
- belongs_to_active_hash :delivery_area
- belongs_to_active_hash :delivery_date



## buyers テーブル

| column            | type           | options                        |
| ----------------- | -------------- | ------------------------------ |
| user              | references     | null: false, foreign_key: true |
| item              | references     | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item



## shipping_addressテーブル

| column        | type             | options                        |
| ------------- | ---------------- | ------------------------------ |
| postal_code   | string           | null: false                    |
| prefecture_id | integer          | null: false                    |
| city          | string           | null: false                    |
| city_address  | string           | null: false                    |
| building_name | string           |                                |
| phone_number  | string           | null: false                    |
| item          | references       | null: false, foreign_key: true |
| buyer         | references       | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :buyer
- belongs_to_active_hash :prefecture