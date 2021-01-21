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

# where age が 20 の人 範囲で指定
# pp User.select("id, name, age").where(age: 20..29)

# 19歳と 31歳 のみ抽出
# pp User.select("id, name, age").where(age: [19, 31])

# where つなげて and 検索 age が 20 の人のみ
# pp User.select("id, name, age").where("age >= 20").where("age < 30")
# ↑ の where を省略
# pp User.select("id, name, age").where("age >= 20 and age < 30")
#
# logger
# [["age", 20], ["age", 29]]
# [#<User:0x007f9eed3afe60 id: 2, name: "takahashi", age: 25>,
# #<User:0x007f9eed3a75d0 id: 4, name: "mizutani", age: 28>]

# or and を or に
pp User.select("id, name, age").where("age <= 20 or age >= 30")

# logger
# [#<User:0x007fc12c401510 id: 1, name: "tanaka", age: 19>,
# #<User:0x007fc12bb2cb10 id: 3, name: "hayashi", age: 31>,
# #<User:0x007fc12bb2c9d0 id: 5, name: "otsuka", age: 35>]
