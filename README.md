# 『GNU Make 第3版』 各章マージ版PDF

[『GNU Make 第3版』 各章マージ版PDF](./make_merged.pdf)は、[O'Reilly Japan - GNU Make 第3版](https://www.oreilly.co.jp/library/4873112699/)で公開されている章別のPDFファイルを、1つにマージし、目次情報を追加したものです。

原書同様、GNU Free Documentation License に従います。GNU Free Documentation License については、PDF内の"付録 C GNU Free Documentation License"を参照ください。

## 使い方

[`make_merged.pdf`](./make_merged.pdf)をダウンロードして、お使い下さい。

## 作成方法

もし、自分でPDFをマージしたい場合は、以下を実行してください。

```shell
make
```

ただし、本プロジェクトの`Makefile`は、macOS 13.2の環境でのみ動作確認しています。
また、以下の外部ツール、リポジトリに依存します。

- bash
- curl
- ghostscript
- git
- python3
- [yutayamamoto/pdfoutline: A command line tool for adding an outline to pdf files](https://github.com/yutayamamoto/pdfoutline)

`Makefile`のコマンドのパスの定義を環境に合せて設定してください。

```Makefile
# commands
TOUCH = touch
CURL = curl
GS = gs
GIT = git
PYTHON3 = python3
```

## 目次情報について

[`toc.txt`](./toc.txt)は目次情報のファイルになります。

[yutayamamoto/pdfoutline: A command line tool for adding an outline to pdf files](https://github.com/yutayamamoto/pdfoutline)を利用して、目次情報をPDFに追加しています。

必要な場合は、[`toc.txt`](./toc.txt)を修正して、再度PDFを作成しなおしてください。
