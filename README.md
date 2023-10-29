## アプリケーション名
iWell  
## アプリケーションの概要
備品・在庫管理者が効率的に棚卸や数量管理ができ、他ユーザーにも情報をスムーズに共有できる。
## URL
https://iwell.onrender.com
## テスト用アカウント
* Basic認証パスワード：1234
* Basic認証ID：user
* メールアドレス：test@test.com
* パスワード：123456abc
## 利用方法
### アイテム登録
1.トップページのヘッダーから新規アイテム登録ページへ遷移する  
2.アイテム情報（アイテム名、カテゴリー、保管場所、数量、単位）など必須項目を入力し登録する
### チャット機能
1.トップページのヘッダーからチャットページへ遷移する  
2.「type a message」に投稿内容を記載（画像添付可）  
3.「送信」を押すと投稿完了
###  発注リスト機能
1.アイテム詳細ページの「リストに入れる」ボタンを押す  
2.トップページ（在庫一覧）の右下にある「発注リスト」をクリックする  
3.「リストに入れる」ボタンを押したアイテムが一覧で表示される
## アプリケーションを作成した背景
前職で発注・備品管理業務を行っていた。業務に膨大な時間がかかっていたことや、データを入力するフォーマットが複数あり情報が入り乱れていた。もっと効率的にわかりやすく管理し、チーム内でも共有することができるアプリがあれば良かったな、と感じており、同じような悩みを持っている元同僚もいたため開発することを決めた。
## 洗い出した要件
https://docs.google.com/spreadsheets/d/1r0e60KVyboVjorjwwugr1Gl-G9ccoa2YRlznt01yG2w/edit#gid=982722306
## 実装した機能についての画像やGIF及びその説明
### アイテム登録
[![Image from Gyazo](https://i.gyazo.com/cb5f3c2402c88976755677a88816105b.gif)](https://gyazo.com/cb5f3c2402c88976755677a88816105b)
* 画像は1つのみ選択でき、プレビューが出る
* 必要に応じて任意項目も入力可能
### チャット機能
[![Image from Gyazo](https://i.gyazo.com/9c605575200dc1915036b800dac0cf1e.gif)](https://gyazo.com/9c605575200dc1915036b800dac0cf1e)
* 確認ボタン（手のマーク）を押すと、数字がカウントされる
* 自分が投稿した投稿のみ編集と削除ができる
###  発注リスト機能
[![Image from Gyazo](https://i.gyazo.com/c67ae12fa5d5a9b72b59c661740560a0.gif)](https://gyazo.com/c67ae12fa5d5a9b72b59c661740560a0)
* リストから削除する場合は、発注リスト内の各アイテムの最右にあるカートボタンを押す
## 実装予定の機能
* アラート機能
* 数量のカウント方法
* プルダウンの内容編集
* QRコード作成機能
## データベース設計
[![Image from Gyazo](https://i.gyazo.com/513ecdce439e04f7f4041003a24e8918.png)](https://gyazo.com/513ecdce439e04f7f4041003a24e8918)
## 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/099adc054ec89193548b3fc66fea1ff6.png)](https://gyazo.com/099adc054ec89193548b3fc66fea1ff6)
## 開発環境
* HTML, CSS
* JavaScript
* Ruby
* Ruby on Rails
* MySQL
* PostgreSQL
* VScode
* GitHub
## ローカルでの動作方法
以下のコマンドを順に実行  
% git clone https://iwell.onrender.com  
% cd iwell  
% bundle install
## 工夫したポイント
* チャット機能を作成し、情報の共有や確認ができるようにした
* 発注リスト機能を作り、発注予定の品をまとめて閲覧できるようにした
* 権限付与をして、従業員の削除ができるのは管理者のみにした
## 制作時間
35日間（200時間程度）