# coffee-marks
http://54.150.180.129/  

ログイン情報  
email: sample@example.com  
password: 123qwe

## 概要
好きな喫茶店、カフェを登録できるアプリです。  
アプリ名は、机に残ったコーヒーの跡を見て決めました。

## アプリケーションの機能一覧
記事投稿機能（星の評価機能、写真投稿）  
投稿編集機能  
ゲストログイン機能  
新規登録・ログイン機能  
ユーザー情報編集  
ページネーション機能  
コメント機能  
サイト内検索機能  
いいね機能  
いいねランキング  
フォロー機能  

## 使用技術(開発環境)
Ruby on Rails、Ruby、Haml、scss、JavaScript、jQuery、レスポンシブ対応、AWS（EC2・S3）

## 制作背景(意図)
自分自身レトロな雰囲気の喫茶店やカフェなこともあり、ネットで探し休日に行きます。  
しかし、大手のアプリで調べると必要のない情報が多くなかなか見つけられないということがあり、喫茶店やカフェに特化した記事投稿アプリ自ら作ろうと思いました。  
このアプリを使用すれば、ユーザーが投稿した喫茶店やカフェを5段階の星の評価、良かったことなどの説明文を見ることで分かりやすく、探すことができます。
また、投稿にコメント機能が付いているので実際に行ってみた感想もコメントすることができます。

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
- has_many: following_relationships, foreign_key: "follower_id", class_name: "Relationship"
- has_many: follower_relationships, foreign_key: "following_id", class_name: "Relationship"

## shopsテーブル
|Column|Type|Option|
|------|----|------|
|id|string|null: false|
|image|string|null: false|
|name|string|null: false|
|evaluation|float|null: false|
|station|string|null: false|
|move|string|null: false|
|time|string|null: false|
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

## relationshipsテーブル
|Column|Type|Option|
|------|----|------|
|follower|references|null: false, foreign_key: { to_table: :users }|
|following|references|null: false, foreign_key: { to_table: :users }|

## Association
- belongs_to :follower, class_name: "User"
- belongs_to :following, class_name: "User"
