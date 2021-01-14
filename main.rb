require 'active_record'
require 'pp'
# logger で sql をデバグ
require 'logger'

# logger の設定 + 標準出力(STDOUT)
ActiveRecord::Base.logger = Logger.new(STDOUT)
ActiveRecord::Base.default_timezone = :local


ActiveRecord::Base.establish_connection(
  # sqlite -> pw 不要
  adapter: 'sqlite3',
  database: './db1.db'
)

# ORM -> object と RDB を結びつける
# オブジェクト名は最初が大文字の単数形
# usere テーブルをオブジェクトに結びつける
# users テーブルのレコードを User クラスのインスタンスとして扱える
class User < ActiveRecord::Base
end

# ファイル実行ごとにデータを消す
User.delete_all

# レコード挿入
User.create(name: "tanaka", age: 19)
User.create(name: "takahashi", age: 25)
User.create(name: "hayashi", age: 31)
User.create(name: "mizutani", age: 28)
User.create(name: "otsuka", age: 35)

# フィールド指定 id の 3 を抽出
# pp User.select("id, name, age").find(3)

# 名前で探す
# pp User.select("id, name, age").find_by(name: "tanaka")
# ↑ () を 省略可能
# pp User.select("id, name, age").find_by name: "tanaka"
# ↑ .find_by のあとにフィールド名をつなげて省略
# pp User.select("id, name, age").find_by_name "tanaka"
# ↑ () を追加しても書ける
# pp User.select("id, name, age").find_by_name("kiriya")
# > nil
# ! がついていた場合、 存在しないレコードではエラーにする処理(通常 nil が返る)
# pp User.select("id, name, age").find_by_name!("kiriya")


# logger out put
# User Load (0.3ms)  SELECT  id, name, age FROM "users" WHERE "users"."name" = ? LIMIT ?  [["name", "tanaka"], ["LIMIT", 1]]

#<User:0x007fc45dc41a70 id: 1, name: "tanaka", age: 19>
