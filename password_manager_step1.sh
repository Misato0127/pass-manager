#!/bin/bash

echo "パスワードマネージャーへようこそ！"
echo "サービス名を入力してください："
# サービス名をserviceName変数に代入する。
read service_name

echo "ユーザー名を入力してください："
# ユーザー名をuserName変数に代入する。
read username

echo "パスワードを入力してください："
# パスワードをpassword変数に代入する。
read -s password

# 入力されたデータを一時ファイルに保存。
echo "$service_name:$username:$password" >> passwords.txt

echo "Thank you!"