# README

これはエムスリー株式会社の techbook 用テンプレートです。

# 参考情報

- Re:VIEW: https://github.com/kmuto/review/
- Re:VIEW image for Docker: https://github.com/vvakame/docker-review
- Re:VIEW フォーマットガイド: https://github.com/kmuto/review/blob/master/doc/format.ja.md

# 動作条件

- Node.js
- Docker

# 事前準備

本プロジェクトでは文章校正ツールとして textlint を使用しています。
関連パッケージをインストールするため、ルートディレクトリで以下コマンドを実行します。

```
yarn install
```

# textlint

textlint の結果を出力するには、ルートディレクトリで以下のコマンドを実行します。

```
npx textlint src/*.re
```

また、以下のようにファイル名を個別に指定して実行することも可能です。

```
npx textlint src/postscript.re
```

textlint のルールは `.textlintrc` でカスタマイズ可能です。
各ルールセットの詳細は下記リンクを参照してください。

- https://github.com/textlint-ja/textlint-rule-preset-japanese
- https://github.com/textlint-ja/textlint-rule-preset-ja-technical-writing

## PDF ビルド

以下のコマンドで src 配下にダウンロード販売用の PDF `techbook-pdf.pdf` が生成されます

```
docker run --rm -v $PWD/src:/work vvakame/review:5.2 /bin/sh -c "cd /work && review-pdfmaker config-pdf.yml"
```

## 入稿用データ ビルド

以下のコマンドで src 配下に入稿用の PDF `techbook-paper.pdf` が生成されます

```
docker run --rm -v $PWD/src:/work vvakame/review:5.2 /bin/sh -c "cd /work && review-pdfmaker config-paper.yml"
```


## 設定必要項目

以下を必要に応じて設定します

 - src/config.yml: pdf設定項目
    - booktitle
    - aut
    - date
    - history
    - rights
 - src/title.tex: 2ページ目タイトル
 - src/catalog.yml: 以下のreファイルへのpath
 - src/preface.re: まえがき
 - src/postscript.re: あとがき
 - src/contributors.re: 執筆者情報
 - src/{foobar}.re: 各章の文章
 - src/images/cover.png: 表紙画像
 - src/images/{foobar}/{hoge}.png: foobar.reで利用される画像
 - .circleci/config.yml: circleci設定
    - `https://hooks.slack.com/services/~~~`: slack post用url
