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

# レコード挿入
# User.create(name: "tanaka", age: 23)
# User.create(name: "hoshi", age: 22)

# ブロックを使いレコード挿入
user = User.new do |u|
  u.name = "mochizuki"
  u.age = 18
end

user.save

# logger out put
# INSERT INTO "users" ("name", "age", "created_at", "updated_at") VALUES (?, ?, ?, ?)
# [["name", "mochizuki"], ["age", 18], ["created_at", "2021-01-13 23:02:52.456842"], ["updated_at", "2021-01-13 23:02:52.456842"]]

# db1
# 1|mochizuki|18|2021-01-13 23:02:52.456842|2021-01-13 23:02:52.456842
