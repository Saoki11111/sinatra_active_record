# sinatra ライブラリ
require 'sinatra'
# WEBRick を再起動しなくてもソース変更がサーバに適用される
require 'sinatra/reloader'

# / に get アクセス →  以下 アクションが実行される
# ruby sinatora_study.rb →  # http://localhost:4567/
get '/' do
  # 'Hello wolrd'
  
  # ルーティング erb に シンボルでファイル名指定 →  views 以下の erb が読み込まれる
  # erb:index

  # ルーティングに画面への値受け渡す →  インスタンス変数に代入
  @title = "index"
  erb:index
end

# シンボルでパラメータをの受け取る
# params から シンボル指定で受け取る params[:arg]
# 展開は #{}
# get '/std/:arg' do
#   "display args#{params[:arg]}"
# end

# ブロック引数で受け取れる
# |arg| を #{arg} で展開
# get '/std/:arg' do |arg|
#   "display args#{arg}"
# end

# 複数のパラメータ
# /std/:id/:usr →  /std/:id/?:usr?
#   ↑ http://localhost:4567/std/5/ で アクセス→  でもエラーにならない
# get '/std/:id/?:usr?' do |id, usr|
#   "display args ID : #{id} User : #{usr}"
# end
