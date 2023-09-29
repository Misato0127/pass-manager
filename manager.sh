#!/bin/bash

echo "パスワードマネージャーへようこそ！"
echo "サービス名を入力してください："
# サービス名をservice_name変数に代入する
read service_name

echo "ユーザー名を入力してください："
# ユーザー名をuser_name変数に代入する
read user_name

echo "パスワードを入力してください："
# パスワードをpassword変数に代入する
read -s password

# データをpassword.txtに書く
echo "$service_name:$username:$password" >> password.txt

echo "Thank you!"

