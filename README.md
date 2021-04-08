## usersテーブル
|column            |Type   |Options |
|------------------|-------|--------|
|email             |unique |NOT NULL|
|encrypted_password|string |NOT NULL|
|last_name_kanji   |string |NOT NULL|
|first_name_kanji  |string |NOT NULL|
|last_name_kana    |string |NOT NULL|
|first_name_kana   |string |NOT NULL|
|nickname          |string |NOT NULL|
|birthday          |date   |NOT NULL|
|address           |string |NOT NULL|
|post              |string |NOT NULL|
|prefectures_id    |integer|NOT NULL|
|municipality      |string |NOT NULL|
|house_number      |string |NOT NULL|
|building          |string |        |
|tel               |string |NOT NULL|

## itemsテーブル
|column     |Type         |Options |
|-----------|-------------|--------|
|item_name  |text         |NOT NULL|
|catch_copy |text         |NOT NULL|
|price      |integer      |NOT NULL|
|day_id     |integer      |NOT NULL|
|from_id    |integer      |NOT NULL|
|status_id  |integer      |NOT NULL|
|category_id|integer      |NOT NULL|
|user       |references   |        |
|purchase   |references   |        |

## mediationテーブル
|column        |Type        |Options |
|--------------|------------|--------|
|item          |references  |        |
|user          |references  |        |