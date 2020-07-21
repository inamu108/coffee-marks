## usersテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|email|string|null false|
|password|string|null: false|
|nickname|string|null: false|
|first_name|string|null: false|
|family_name|string|null: false|

### Association
- has_many: cafes
- has_many: comments
- has_many: favorites

## cafesテーブル
|Column|Type|Option|
|------|----|------|
|id|string|null: false|
|image|text|null: false|
|name|string|null: false|
|evaluation|float|null: false|
|prefecture_code|integer|null: false|
|station|string|null: false|
|description|text|

## Association
- belongs_to :user
- has_many :comments, dependent: :destroy
- has_many :favorites

## commentsテーブル
|Column|Type|Option|
|------|----|------|
|comment|text|null: false|
|user|references|null: false, foreign_key: true|
|cafe|references|null: false foreign_key: true|

## Association
- belongs_to :user
- belongs_to :cafe

## favoritesテーブル
|Column|Type|Option|
|------|----|------|
|user|references|null: false, foreign_key: true|
|cafe|references|null: false, foreign_key: true|

## Association
- belongs_to :user
- belongs_to :cafe