## テーブル設計

### Users テーブル

| Colum            | Type        | Option                 |
| -----------------| ------------| -----------------------|
| email            | string      | null: false            |
|encrypted_password| string      | null: false            |
| name             | string      | null: false            |
| profile          | text        | null: false            |
| position         | text        | null: false            |
| occupation       | text        | null: false            |

### prototype テーブル

| Colum            | Type        | Option                 |
| -----------------| ------------| -----------------------|
| title            | string      | null: false            |
| catch_copy       | text        | null: false            |
| concept          | text        | null: false            |
| user             | references  | null: false            |

### Comments テーブル

| Colum            | Type        | Option                 |
| -----------------| ------------| -----------------------|
| content          | text        | null: false            |
| prototype        | references  | null: false            |
| user             | references  | null: false            |