#!/bin/bash
# ループ内で選択を表示し、ユーザーの入力に適した処理を実行する。
while true; do
    echo "パスワードマネージャーへようこそ！"
    echo "次の選択肢から入力してください(Add Password/Get Password/Exit):"
    read choice

    case $choice in
        "Add Password")
        
            # サービス名をserviceName変数に代入する。
            read -p "サービス名を入力してください: " serviceName
            # ユーザー名をuserName変数に代入する。
            read -p "ユーザー名を入力してください: " userName
            # パスワードをpassword変数に代入する。
            read -s -p "パスワードを入力してください: " password
            # 入力されたデータを一時ファイルに保存。
            echo "$serviceName:$userName:$password" >> passwords.txt
            echo "パスワードの追加は成功しました。"
            ;;
        "Get Password")
            read -p "サービス名を入力してください: " serviceName
            # serviceNameに対応するuserName, passwordを「.passwords」から取得。
            password=$(grep "^$serviceName:" passwords.txt | cut -d: -f3)

            if [ -z "$password" ]; then
                echo "そのサービスは登録されていません。"
            else
                echo "サービス名：$serviceName"
                # サービス名に対応するユーザー名を表示。
                echo "ユーザー名：$(grep "^$serviceName:" passwords.txt | cut -d: -f2)"
                # サービス名に対応するパスワードを表示。
                echo "パスワード：$password"
            fi
            ;;
        "Exit")
            echo "Thank you!"
            exit
            ;;
        *)
            # どの値にも一致しなかった場合の処理
            echo "入力が間違えています。Add Password/Get Password/Exitから入力してください。"
            ;;
     # case終了
    esac
# while終了
done