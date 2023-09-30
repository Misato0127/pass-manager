## パスワードマネージャーの機能

パスワードマネージャーとは、IDとパスワードを安全に管理するためのツールです。

複数のサービスのIDとパスワードを保存することができます。

ファイルの暗号化を行っているのでセキュリティ対策もしています。
## 工夫をしたところ

- Issueドリブン開発をし、GitHub上でタスクを管理しながら開発を行いました。
- ユーザーがが空文字を入力した場合にはエラーメッセージが表示されます。
- GnuPG(GNU Privacy Guard)を用いてファイルを暗号化します。
- パスワードマネージャーで設定したパスワードを入力することでしかユーザーが保存したパスワードを閲覧できないようにしました。


## 使い方

### 1. GnuPGをインストールしてください
   - GnuPG: ファイルを暗号化するソフトウェアです。
   - 下記のコマンドで、インストールできます。
```shell
 sudo yum install gnupg
```
### 2. pass-managerリポジトリのZIPをダウンロード
  - GitHubのリポジトリの「<>code」ボタンをクリックして、「Download ZIP」からダウンロードしてください。

### 3. password_manager_step3.shを実行

  - 下記のコマンドを入力してください。
```shell
 chmod +x password_manager_step3.sh
 ./password_manager_step3.sh
```