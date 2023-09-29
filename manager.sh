#!/bin/bash
#  ループ内で選択を表示し、ユーザーの入力に適した処理を実行する。
while true; do
    echo "パスワードマネージャーへようこそ！"
    echo "終了したい場合は Exit と入力してください。"

    echo "次の選択肢から入力してください(Add Password/Get Password/Exit):"
    read choice

    case $choice in
        "Add Password")
 
            # サービス名をserviceName変数に代入する
            read -p "サービス名を入力してください: " serviceName
            # 空文字の場合、エラーメッセージを表示。
            serviceName="${serviceName:?サービス名を設定してください。}"

            # ユーザー名をuserName変数に代入する
            read -p "ユーザー名を入力してください: " userName
             # 空文字の場合、エラーメッセージを表示。
            userName="${userName:?ユーザー名を設定してください。}"

            # パスワードをpassword変数に代入する
            read -s -p "パスワードを入力してください: " password
             # 空文字の場合、エラーメッセージを表示。
            password="${password:?パスワードを設定してください。}"

            # 入力されたデータを一時ファイルに保存。
            echo "$serviceName:$userName:$password" >> passwords
            # 一時ファイルを隠しファイルにコピーする。
            cp passwords .passwords 
            # 上記の一時ファイルを暗号化する。
            gpg -c passwords
            # 暗号化されたものを一時ファイルにコピーし、パスワードを見えなくする。
            cp passwords.gpg passwords
            
             echo "パスワードの追加は成功しました。"
            ;;

            
        "Get Password")
            # 復号化する。
            gpg passwords.gpg
            #復号化したファイルを隠しファイルにコピーする。
            cp passwords .passwords
            #復号化したファイルを削除する。
            rm passwords
            
            read -p "サービス名を入力してください: " serviceName
            # serviceNameに対応するuserName, passwordを「.passwords」から取得。
            userName=$(grep "^$serviceName:" .passwords | cut -d: -f2)
            password=$(grep "^$serviceName:" .passwords | cut -d: -f3)
            
            if [ -z "$password" ]; then
                echo "そのサービスは登録されていません。"
            else
                echo "サービス名：$serviceName"
                # サービス名に対応するユーザー名を表示。
                echo "ユーザー名：$userName"
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
