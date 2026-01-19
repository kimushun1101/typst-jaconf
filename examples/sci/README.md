![Compile workflow](https://github.com/kimushun1101/sci25-typst/actions/workflows/compile.yml/badge.svg)
![Deploy workflow](https://github.com/kimushun1101/sci25-typst/actions/workflows/release.yml/badge.svg)
![Pages workflow](https://github.com/kimushun1101/sci25-typst/actions/workflows/gh-pages.yml/badge.svg)

# sci25-typst

> [!NOTE]
> このソースコードはTypst version 0.12で作成しております．

[第69回 システム制御情報学会 研究発表講演会](https://sci25.iscie.or.jp/)の原稿を Typst で書くときのテンプレートです．  
コンパイルしたサンプルは [sample.pdf](https://kimushun1101.github.io/sci25-typst/sample.pdf) で確認できます．  
Typst の概要については [Typstで執筆するには](https://typst-jp.github.io/docs/tutorial/writing-in-typst/) をご覧ください．  

[vscode-typst.webm](https://github.com/kimushun1101/typst-jp-conf-template/assets/13430937/f227b85b-0266-417b-a24a-54f28f9a71b8)


| ファイル     | 意味                           |
| ---------- | ------------------------------ |
| main.typ   | 原稿雛形の Typst ソースコード      |
| sample.typ | サンプルの Typst ソースコード      |
| lib.typ    | 体裁を整える Typst ソースコード    |
| sci.csl    | 参考文献の体裁を整える CSL ファイル |
| refs.*     | 参考文献ファイル                  |


| ディレクトリ    | 含まれるファイルの種類          |
| ------------- | --------------------------- |
| figs          | 論文に使用する画像ファイル      |
| .vscode       | VS Code用の設定ファイル       |


## 使用方法
GitHub に慣れていない方は，[GitHub Releaseから最新版のzipファイル](https://github.com/kimushun1101/sci25-typst/releases/latest/download/typst-sci.zip)をダウンロードして展開してください．  
慣れている方は，`git clone` したり `use this template` したり，適宜扱ってください．  
もし不具合や修正提案などありましたら，GitHub の [Issues](https://github.com/kimushun1101/sci25-typst/issues) や [Pull requests](https://github.com/kimushun1101/sci25-typst/pulls) などをご活用ください．

### VS Code の場合
1. [VS Code](https://code.visualstudio.com/) をインストール．
2. VS Code で `File`→`Open Folder` で zip 展開したフォルダーを開く．  
3. 推奨拡張機能をインストール．  
  Extensions (`Ctrl` + `Shift` + `X`) の `Search Extensions in Marketplace` のテキストボックスに `@recommended` と入力すると表示される，以下の拡張機能をinstall をクリック．  
    - [Tinymist Typst](https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist)
4. Explorer (`Ctrl` + `Shift` + `E`) から `sample.typ` を開いた状態で，画面右上にある Typst Preview の方の ![view-icon](https://github.com/kimushun1101/typst-jp-conf-template/assets/13430937/a44c52cb-d23a-4fdb-ac9f-dc2b47deb40a) アイコンをクリック (
 `Ctrl` + `K` のあと `V`) でプレビューを表示．[トップにある動画](#sci25-typst) の操作です．
5. `Ctrl` + `S` で PDF を生成．

### Typst app の場合
1. [Typst app](https://typst.app/)から `Sign up` でアカウントを作成．
2. `Empty document` から新規プロジェクトを作成．
3. zip 展開したファイルおよびフォルダーをアップロード．
4. Files で表示したいファイル（例えば sample.typ など）の![image](https://github.com/user-attachments/assets/bf5dc1c8-78c4-4bb9-9d78-b8ea93271236)アイコンをクリック．

### その他のエディターの場合

他のエディターでも VS Code と同様の拡張機能があるかもしれません．  
また，コンパイルは Command Line Interface (CLI) でも行えます．  
1. Typst CLI をインストールする．
  - Windows
    PowerShell を開き以下のコマンドを入力．
    ```powershell
    winget install --id Typst.Typst
    ```
    `winget` コマンドが有効でない場合には，Microsoft Store から [アプリインストーラー](https://apps.microsoft.com/detail/9nblggh4nns1) をインストールすると使えるようになります．
  - Mac
    [Homebrew](https://brew.sh/ja/) を導入して，以下のコマンドを入力．
    ```sh
    brew install typst
    ```![Screenshot from 2024-12-09 01-34-48](https://github.com/user-attachments/assets/4a0cd908-b170-4004-91fe-faf3c003c8f1)

  - Rust を通してインストール
    Ubuntu の場合などはこの方法をオススメします．
    [Rust](https://www.rust-lang.org/ja/tools/install) をインストールして，以下のコマンドを入力．
    ```sh
    cargo install --locked typst-cli
    ```
2. PowerShell やターミナルで zip 展開したディレクトリに移り，以下のコマンドで `sample.pdf` を生成．
  ```
  typst compile sample.typ
  ```

## ライセンス
参考元にならってライセンスを付与しています．  
Typst ファイル : MIT No Attribution  
CSL ファイル : Creative Commons Attribution-ShareAlike 3.0 License  
