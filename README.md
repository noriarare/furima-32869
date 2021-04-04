## usersテーブル
|column           |Type  |Options |
|-----------------|------|--------|
|email            |string|NOT NULL|
|password         |string|NOT NULL|
|last_name_kanji  |string|NOT NULL|
|first_name_kanji |string|NOT NULL|
|last_name_kana   |string|NOT NULL|
|first_name_kana  |string|NOT NULL|
|nickname         |string|NOT NULL|
|birthday         |string|NOT NULL|

## itemsテーブル
|column    |Type         |Options |
|----------|-------------|--------|
|item_name |text         |NOT NULL|
|catch_copy|text         |NOT NULL|
|price     |string       |NOT NULL|
|day       |string       |NOT NULL|
|form      |string       |NOT NULL|
|status    |text         |NOT NULL|
|category  |text         |NOT NULL|
|image     |ActiveStorage|        |
|user      |references   |        |
|purchase  |references   |        |

## purchasesテーブル
|column      |Type        |Options |
|------------|------------|--------|
|address     |string      |NOT NULL|
|post        |string      |NOT NULL|
|prefectures |string      |NOT NULL|
|municipality|string      |NOT NULL|
|house_number|string      |NOT NULL|
|building    |string      |NOT NULL|
|tel         |string      |NOT NULL|
|credit      |string      |NOT NULL|
|security    |string      |NOT NULL|
|item        |references  |        |