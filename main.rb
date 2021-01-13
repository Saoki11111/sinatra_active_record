require 'active_record'
require 'pp'
require 'logger'

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
# user = User.new
# user.name = "tanaka"
# user.age = 23
# user.save

# ↑ の省略形

# user = User.new(name: "tanaka", age: 23)
# user.save

# ↑ の更に省略形
User.create(name: "tanaka", age: 23)
User.create(name: "hoshi", age: 22)

User.find_all
