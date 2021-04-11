## usersテーブル
|column            |Type   |Options     |
|------------------|-------|------------|
|email             |string |uniqure:true,null:false|
|encrypted_password|string |null:false             |
|last_name         |string |null:false             |
|first_name        |string |null:false             |
|last_name_kana    |string |null:false             |
|first_name_kana   |string |null:false             |
|nickname          |string |null:false             |
|birthday          |date   |null:false             |

### Assosiation
- has_many :histories
- has_many :items

## itemsテーブル
|column     |Type      |Options                     |
|-----------|----------|----------------------------|
|name　　　  |string    |null:false                  |
|catch_copy |text      |null:false                  |
|price      |integer   |null:false                  |
|day_id     |integer   |null:false                  |
|shipping_id|integer   |null:false                  |
|from_id    |integer   |null:false                  |
|status_id  |integer   |null:false                  |
|category_id|integer   |null:false                  |
|user       |references|null:false,foreign_key: true|

### Assosiation
- has_to :histories
- belongs_to :users

## historiesテーブル
|column        |Type        |Options                     |
|--------------|------------|----------------------------|
|item          |references  |null:false,foreign_key: true|
|user          |references  |null:false,foreign_key: true|

### Assosiation
- has_many :users
- belongs_to :items
- has_one ;addresses

## addressesテーブル
|column        |Type      |Options                     |
|--------------|----------|----------------------------|
|address       |string    |null:false                  |
|post          |string    |null:false                  |
|from_id       |integer   |null:false                  |
|municipality  |string    |null:false                  |
|house_number  |string    |null:false                  |
|building      |string    |                            |
|tel           |string    |null:false                  |
|histories     |references|null:false,foreign_key: true|

### Assosiation
- belongs_to :histories