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

# 全件取得
# pp User.all

# created_at, updated_at が不要 それ以外を抽出
pp User.select("id, name, age").all

# logger out put
# User Create (3.9ms)  INSERT INTO "users" ("name", "age", "created_at", "updated_at") VALUES (?, ?, ?, ?)  [["name", "tanaka"], ["age", 19], ["created_at", "2021-01-14 09:18:51.286930"], ["updated_at", "2021-01-14 09:18:51.286930"]]

# db1
# [#<User:0x007f896d1326c8
#   id: 1,
#   name: "tanaka",
#   age: 19,
#   created_at: "2021-01-14 09:18:51.286930",
#   updated_at: "2021-01-14 09:18:51.286930">,

# logger select 時
# User Create (1.8ms)  INSERT INTO "users" ("name", "age", "created_at", "updated_at") VALUES (?, ?, ?, ?)  [["name", "tanaka"], ["age", 19], ["created_at", "2021-01-14 09:28:35.295140"], ["updated_at", "2021-01-14 09:28:35.295140"]]

# db1 select 時
# [#<User:0x007fd78d210720 id: 1, name: "tanaka", age: 19>,
#  #<User:0x007fd78d203d68 id: 2, name: "takahashi", age: 25>,
#  #<User:0x007fd78d203c28 id: 3, name: "hayashi", age: 31>,
#  #<User:0x007fd78d203ac0 id: 4, name: "mizutani", age: 28>,
#  #<User:0x007fd78d203980 id: 5, name: "otsuka", age: 35>]
