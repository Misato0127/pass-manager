#!/bin/bash
# ループ内で選択を表示し、ユーザーの入力に適した処理を実行する
while true; do
    echo "パスワードマネージャーへようこそ！"
    echo "次の選択肢から入力してください(Add Password/Get Password/Exit):"
    # 入力内容をchoice変数に代入する
    read choice

    case $choice in
        "Add Password")
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
echo "$service_name:$user_name:$password" >> password.txt
            echo "パスワードの追加は成功しました。"
            ;;
        "Get Password")
            read -p "サービス名を入力してください: " service_name
            # サービス名をpasswords.txtファイルから取得
            Password=$(grep "^$service_name:" password.txt | cut -d: -f3)

            if [ -z "$Password" ]; then
                echo "そのサービスは登録されていません。"
            else
                echo "サービス名：$service_name"
                # ユーザー名をpassword.txtファイルから取得
                echo "ユーザー名：$(grep "^$service_name:" password.txt | cut -d: -f2)"
                # パスワードをpassword.txtファイルから取得
                echo "パスワード：$Password"
            fi
            ;;
        "Exit")
            echo "Thank you!"
            exit
            ;;
        *)
	# エラーメッセージを表示する
            echo "入力が間違えています。Add Password/Get Password/Exitから入力してください。"
            ;;
    esac
done

