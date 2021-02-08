# テーブル設計

## usersテーブル

| Column     | Type   | Options                   |
| ---------- | ------ | ------------------------- |
| email      | string | null: false, unique: true |
| password   | string | null: false               |
| nickname   | string | null: false               |
| first_name | string | null: false               |
| last_name  | string | null: false               |
| first_kana | string | null: false               |
| last_kana  | string | null: false               |
| birthday   | integer| null: false               |

### Association

- has_many :items
- has_many :addresses

## itemsテーブル

| Column         | Type          | Options                        |
| -------------- | ------------- | ------------------------------ |
| title          | string        | null: false                    |
| description    | text          | null: false                    |
| category       | string        | null: false                    |
| state          | string        | null: false                    |
| shipping       | string        | null: false                    |
| consignor_area | string        | null: false                    |
| days           | string        | null: false                    |
| price          | integer       | null: false                    |
| image          | ActiveStorage |                                |
| user           | references    | null: false, foreign_key: true |

### Association

- has_one    :address
- belongs_to :user

## addressesテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_number   | integer    | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| street_number | string     | null: false                    |
| building      | string     |                                |
| tel           | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item