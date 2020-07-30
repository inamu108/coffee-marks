# coffee-marks
## 概要
好きな喫茶店、カフェを登録できるアプリです。  
アプリ名は、机に残ったコーヒーの跡を見て決めました。

## アプリケーションの機能一覧
記事投稿機能（星の評価機能、写真投稿）  
投稿編集機能  
新規登録・ログイン機能  
ユーザー情報編集  
ページネーション機能  
コメント機能(非同期通信)  
サイト内検索機能  
いいね機能

## 使用技術(開発環境)
Ruby on Rails、Ruby、Haml、scss、JavaScript、jQuery

## 制作背景(意図)
自分自身レトロな雰囲気の喫茶店やカフェなこともあり、ネットで探し休日に行きます。  
しかし、大手のアプリで調べると必要のない情報が多くなかなか見つけられないということがあり、喫茶店やカフェに特化した記事投稿アプリ自ら作ろうと思いました。  
このアプリを使用すれば、ユーザーが投稿した喫茶店やカフェを5段階の星の評価、良かったことなどの説明文を見ることで分かりやすく、探すことができます。
また、投稿にコメント機能が付いているので実際に行ってみた感想もコメントすることができます。

## 今後の実装予定の内容  
・通知機能  


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
- has_many: shops
- has_many: comments
- has_many: likes

## shopsテーブル
|Column|Type|Option|
|------|----|------|
|id|string|null: false|
|image|string|null: false|
|name|string|null: false|
|evaluation|float|null: false|
|prefecture_code|integer|null: false|
|station|string|null: false|
|move|string|null: false|
|time|integer|null: false|
|description|text|
|user|references|null: false, foreign_key: true|

## Association
- belongs_to :user
- has_many :comments, dependent: :destroy
- has_many :likes

## commentsテーブル
|Column|Type|Option|
|------|----|------|
|text|text|null: false|
|user|references|null: false, foreign_key: true|
|shop|references|null: false foreign_key: true|

## Association
- belongs_to :user
- belongs_to :shop

## likesテーブル
|Column|Type|Option|
|------|----|------|
|user|references|null: false, foreign_key: true|
|shop|references|null: false, foreign_key: true|

## Association
- belongs_to :user
- belongs_to :shop