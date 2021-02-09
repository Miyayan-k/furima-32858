# テーブル設計

## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_kana         | string | null: false               |
| last_kana          | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items

## itemsテーブル

| Column            | Type          | Options                        |
| ----------------- | ------------- | ------------------------------ |
| title             | string        | null: false                    |
| description       | text          | null: false                    |
| category_id       | integer       | null: false                    |
| state_id          | integer       | null: false                    |
| shipping_id       | integer       | null: false                    |
| consignor_area_id | integer       | null: false                    |
| days_id           | integer       | null: false                    |
| price             | integer       | null: false                    |
| user              | references    | null: false, foreign_key: true |

### Association

- belongs_to :user


## addressesテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_number   | string     | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| street_number | string     | null: false                    |
| building      | string     |                                |
| tel           | string     | null: false                    |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase

## Purchasesテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- has_one :address