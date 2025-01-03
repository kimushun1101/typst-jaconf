// MIT No Attribution
// Copyright 2024 Shunsuke Kimura

// Set the Fonts
// #let gothic = ("BIZ UDPGothic", "MS PGothic", "Hiragino Kaku Gothic Pro", "IPAexGothic", "Noto Sans CJK JP")
// #let mincho = ("BIZ UDPMincho", "MS PMincho", "Hiragino Mincho Pro", "IPAexMincho", "Noto Serif CJK JP")
// #let latin = ("Times New Roman", "New Computer Modern")
// This may warn of missing font families.
// Warnings can be resolved by setting the following for each OS.

// example 1: Windows
// #let gothic = ("MS PGothic")
// #let mincho = ("MS PMincho")
// #let latin = ("Times New Roman")

// example 2: Mac OS
// #let gothic = ("Hiragino Kaku Gothic Pro")
// #let mincho = ("Hiragino Mincho Pro")
// #let latin = ("Times New Roman")

// example 3: Linux or Typst app
#let gothic = ("Noto Sans CJK JP")
#let mincho = ("Noto Serif CJK JP")
#let latin = ("New Computer Modern")

// Select the Template
#import "libs/rsj-conf/lib.typ": rsj-conf as temp, definition, lemma, theorem, corollary, proof, appendix
// #import "libs/rengo/lib.typ": rengo as temp, definition, lemma, theorem, corollary, proof, appendix
// #import "libs/mscs/lib.typ": mscs as temp, definition, lemma, theorem, corollary, proof, appendix

#show: temp.with(
  title-ja: [Typst を使った国内学会論文の書き方 \ - 国内学会予稿集に似せたフォーマットの作成 - ],
  title-en: [How to Write a Conference Paper in Japanese],
  authors-ja: [◯ 著者姓1 著者名1、著者姓2 著者名2(○○○大学)，著者姓3 著者名3 (□□□株式会社)],
  authors-en: [\*A. First, B. Second (○○○ Univ.), and C. Third (□□□ Corp.)],
  abstract: [#lorem(80)],
  keywords: ([Typst], [conference paper writing], [manuscript format]),
  // bibliography: bibliography("refs.yml", full: false),
  font-gothic: gothic,
  font-mincho: mincho,
  font-latin: latin
)

= はじめに
#text("これは非公式のサンプルです。", fill: rgb(red), weight: "bold")
適宜投稿先の規定をご確認ください。
発表論文原稿をPDFでご執筆いただき、学会のホームページにアップロードしてください。
このファイルはこのテンプレートの使い方を示しており，同時に発表論文の見本でもあります．
執筆の時は以下の説明をよく読み，執筆要項に従ったフォーマットでご提出ください．
アップロードした PDF がそのまま公開されます．
というような説明が書かれるであろうテンプレートを作ってみました．
本稿では，このテンプレートファイルの使い方および Typst による執筆作業の概要について解説します．
この原稿のソースコードは https://github.com/kimushun1101/typst-jp-conf-template で公開しております．
Typst の概要についてお知りになりたい方は，https://github.com/kimushun1101/How-to-use-typst-for-paper-jp にもスライド形式の資料を用意しておりますので，ぜひこちらもご覧ください．

= テンプレートファイルの使い方
GitHub に慣れていればテンプレートリポジトリを使用して，新しいリポジトリを作成してクローン．不慣れであれば zip ダウンロードして展開してください．

テンプレートファイルは以下の２つの方法で実行できることを確認しています．
+ VS Code とその拡張機能を使う
+ 好みのエディターで編集した後 CLI (Command Line Interface) でビルドする

== Visual Studio Code による執筆
コマンドライン入力に忌避感のある方は（またそうでない方も） Visual Studio Code (VS Code) の使用をオススメします．
VS Code の拡張機能である Tinymist Typst をインストールすれば，編集中においても現在の出力結果を常に確認することができます．
また，`.vscode/settings.json` にて保存と同時に PDF ファイルが作成される設定にしております．

== Typst CLI によるビルド

=== インストール
- Windows の場合\ Windows PowerShell から以下のコマンドでインストールできる．
```sh
winget install --id Typst.Typst
```
- Mac の場合\ Homebrew を使ってインストールできる．
```sh
# Homebrew のインストール
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# Typst のインストール
brew install typst
```
- Rust からインストール\ たとえば Ubuntu の場合は，Rust の cargo を使ってインストールする方法が簡単と思われます．
```sh
# Rust のインストール
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# Typst のインストール
cargo install --git https://github.com/typst/typst --locked typst-cli
```

=== ビルド
シェルで対象のディレクトリに移り
```sh
typst compile main.typ
```
とコマンドすれば main.pdf をビルドできます．

== このパッケージが使えない場合
ビルドができない場合などのトラブルがございましたら，https://github.com/kimushun1101/typst-jp-conf-template/issues でご相談ください．
以下に対応方法を記載します．

=== パッケージの自動インストールができない場合
大学や会社などのプロキシ環境によっては，パッケージの自動インストールがブロックされてしまう可能性がある．
その場合には Tyspt Universe から圧縮ファイルを手動でダウンロードする．
本サンプルで使用しているパッケージを入手できるリンクは以下のとおりである．
- https://typst.app/universe/package/sourcerer
- https://typst.app/universe/package/ctheorems
これらの圧縮ファイルを main.typ と同じフォルダーにある libs フォルダーの中に展開した後，以下のようにコメントアウトを付け替えて，それぞれの lib.typ ファイルへのパスを指定する．
```typ
  // ソースコードブロックを表示するためのパッケージ
  #import "@preview/codly:1.1.1": codly-init
  #show: codly-init.with()

  // 定理環境
  // #import "@preview/ctheorems:1.1.3": thmplain, thmproof, thmrules
  #import "libs/ctheorems-1.1.3/lib.typ": thmplain, thmproof, thmrules  // 2.3.1 を参照
```

= 原稿の体裁

== レイアウトとフォント
用紙サイズは A4，縦250 mm，横170 mm の枠内に収まるようにしてください．
余白は，上 20 mm，下27 mm，左20 mm，右20 mm とします．
タイトル，著者，アブストラクトはシングルコラム，本文はダブルコラムです．
アブストラクトは左右に 0.7 cm 余白を取っています．

フォントの設定は @tab:fonts の通りです．
ここで，ゴシック体とは "BIZ UDPGothic", "MS PGothic", "Hiragino Kaku Gothic Pro", "IPAexGothic", "Noto Sans CJK JP" のいずれか，明朝体とは "BIZ UDPMincho", "MS PMincho", "Hiragino Mincho Pro", "IPAexMincho", "Noto Serif CJK JP" のいずれかで見つかるものが採用されます．
これらのフォントがお使いのコンピュータになければインストールするか，代わりに使いたいフォントがあればソースコードの方に追加してください．
以下のコマンドで使用可能なフォント一覧を確認できます．
```sh
typst fonts
```

#figure(
  placement: bottom,
  caption: [フォントの設定],
  table(
    columns: 3,
    stroke: none,
    table.header(
      [項目],
      [サイズ (pt)],
      [フォント],
    ),
    table.hline(),
    [#text(18pt, "タイトル")], [18], [ゴシック体],
    [#text(12pt, "著者名")], [12], [ゴシック体],
    [#text(12pt, "章タイトル")], [12], [ゴシック体],
    [節，小節，本文], [10], [明朝体],
    [#text(9pt, "参考文献")], [9], [明朝体],
  )
) <tab:fonts>

今回使用しているテンプレートは "rsj-conf/lib.typ" に記載されています．
このテンプレートのソースコードは charge-ieee と abiding-ifacconf というテンプレートを参考にして，第41回日本ロボット学会学術講演会のフォーマットに近づけて作成しました．
テンプレートの検索は Typst Universe https://typst.app/universe ででき，そこで掲載されているテンプレートのソースコードは https://github.com/typst/packages/tree/main/packages/preview で見ることができます．

== 数式・図・表
数式番号は @eq:system のように数式の右側に， 図のタイトルは "@fig:quadratic タイトル名"のように図の下部に，表のタイトルは "@tab:fonts タイトル名" のように図の上部につきます．
投稿先に応じてキャプションの言語は日本語や英語で指定されるかと思いますので，指示に従ってください．

== 定理環境
以下は，theorem 環境の使用例です．
現バージョンでは日本語に太字が使えない変わりに，フォントをゴシックにすることでそれっぽく見せています．

#definition("用語 A")[
  用語 A の定義を書きます．
]<def:definition1>
#lemma[
  補題を書きます．タイトルは省略することもできます．
]<lem:lemma1>
#lemma("補題 C")[
  補題を書きます．番号は定義や補題ごとに 1 からカウントします．
]<lem:lemma2>
#theorem("定理 D")[
  ここに定理を書きます．
]<thm:theorem1>
#corollary[
  系を書きます．@def:definition1 のように，ラベルで参照することもできます．
]
#proof([@thm:theorem1 の証明])[
  証明を書きます．証明終了として□印をつけています．
]

== 特殊な章
謝辞と参考文献は他の章とは異なり，章番号が自動でつかないように設定しています．
また，参考文献は "参　考　文　献" とスペースで区切り，中央揃えにしています．

= 編集の仕方

== 論文情報の編集
main.typ の文頭にある以下のコードを解説します．
```typ
  #import "libs/rsj-conf/lib.typ": rsj-conf
  #show: rsj-conf.with(
    title: [Typst を使った国内学会論文の書き方 \ - 国内学会予稿集に似せたフォーマットの作成 - ], 
    authors: [◯ 著者姓1 著者名1，著者姓2 著者名2(○○○大学)，著者姓3 著者名3 (□□□株式会社)],
    abstract: [#lorem(80)],
    bibliography: bibliography("refs.yml", full: false)
  )
```
1 行目はこの原稿の体裁を設定するためのソースコードを import しています．
これは "libs" ディレクトリ以下にあります．
2 行目は，ソースコードやコマンドなどを綺麗に表示するための "code" 関数を呼び出すために import しています．
こちらは "libs" ディレクトリにはありません．
Typst Universe から自動でインストールされたものを使っております．
その他，Typst Universe で使いたい packages があるとここで同様に import しておくとよいでしょう．
// 今回 rsj-conf という論文体裁手元のファイルを使用しておりますが，テンプレートファイルも登録することができます．
// 将来的には Typst Universe に登録しようと思います．
4 行目では，1行目で読み込んだ関数を使用して，原稿体裁を作成しています．
5 行目ではタイトルを，6行目では著者一覧を，7 行目ではアブストラクトを記載します．
各内容の中で改行をしたい場合には，`\` で改行してください．
`lorem` 関数は英文のダミーテキストを作成してくれる関数です．
8 行目の参考文献については本章の最後の節で説明します．

また，異なるテンプレートも用意してみました．
コメントアウトで切り替えてみてください．
```typ
  #import "libs/rengo/lib.typ": rengo
  #show: rengo.with(
    title: [Typst を使った国内学会論文の書き方 \ - 国内学会予稿集に似せたフォーマットの作成 - ], 
    authors: [◯ 著者姓1 著者名1，著者姓2 著者名2(○○○大学)，著者姓3 著者名3 (□□□株式会社)],
    title-en: [How to write a conference paper in Japanese],
    authors-en: [\*A. First, B. Second (○○○ Univ.), and C. Third (□□□ Corp.)],
    abstract: [#lorem(80)],
    keywords: ([Typst], [conference paper writing], [manuscript format]),
    bibliography: bibliography("refs.yml", full: false)
  )
```
このフォーマットですと，`title-en`, `authors-en`, `keywords` が追加されており，それぞれ英語タイトル，英語著者名，キーワードを意味しています．
`keywords` は`()` のリスト形式で指定されていることに注意してください．

`#import` でテンプレートの関数を持ってくるところと，その関数を使用するところ以外の本文部分のコードはテンプレートの変更に応じて変更する必要はありません．

== 基本的な文法
章は `=`，節は `==`，小節は `===` で始めます．
改段落は LaTeX と同じく改行を 2 つ以上挟みます．
数字つき箇条書きは `+` で，数字なしの箇条書きは `-` を文頭につけて書くことができます．
テキストの装飾は text 関数で行えます．
LaTeX に慣れている方は，Typst 公式ページの https://typst.app/docs/guides/guide-for-latex-users/ を読むと雰囲気がつかめると思います．

== 数式
数式番号をつけるような中央揃えの数式は，最初の`$` の後ろと閉じの`$` の前にスペースを挟み
```typ
  $ dot(x) &= A x + B u \
  y &= C x $ <eq:system>
```
のように書き，文中に書く数式は，`$` の前後にスペースを挟まず
```typ
  $x in RR^n$
```
というように書きます．
ここで `<eq:system>` は引用するときのラベルになります．

出力例はつぎの通りです．
以下のシステムを考える．
$ dot(x) &= A x + B u \
 y &= C x $ <eq:system>
ここで $x in RR^n$ は状態，$u in RR^m$ は入力，$y in RR^l$ は出力，$A in RR^(n times n)$，$B in RR^(n times m)$．および $C in RR^(l times n)$ は定数行列である．
このシステムに対して，目標値 $r(t)$ に対する偏差を $e = r - y$ とした以下の PI 制御器を使用する．
$ u = K_P e + K_I integral_0^t e d t $ <eq:PI-controller>
ただし，$K_P$ と $K_I$ はそれぞれ比例ゲイン，積分ゲインとする．

== 図と表
本稿を執筆時のバージョン Typst 0.11.0 では，PNG, JPEG, GIF, SVG の形式のイメージデータを挿入することができます．
例としては以下の通りです．
```typ
  #figure(
    placement: bottom,
    image("figs/quadratic.svg", width: 90%),
    caption: [$x^2$ のグラフ],
  ) <fig:quadratic>

  #figure(
    placement: bottom,
    image("figs/sqrt-and-sin.png", width: 90%),
    caption: [$sqrt(x)$ と $sin x$ のグラフ],
  ) <fig:sqrt-sin>
```
ここで placement は，紙面の上 (top) に寄せるか下 (bottom) に寄せるかを決められます．言及している文章に近い方に調整してください．

#figure(
  placement: bottom,
  image("figs/quadratic.svg", width: 90%),
  caption: [$x^2$ のグラフ],
) <fig:quadratic>

#figure(
  placement: bottom,
  image("figs/sqrt-and-sin.png", width: 90%),
  caption: [$sqrt(x)$ と $sin x$ のグラフ],
) <fig:sqrt-sin>

@tab:fonts は以下で記述されております．
```typ
  #figure(
    placement: top,
    caption: [フォントの設定],
    table(
      columns: 3,
      stroke: none,
      table.header(
        [項目],
        [サイズ (pt)],
        [フォント],
      ),
      table.hline(),
      [#text(18pt, "タイトル")], [18], [ゴシック体],
      [#text(12pt, "著者名")], [12], [ゴシック体],
      [#text(12pt, "章タイトル")], [12], [ゴシック体],
      [節，小節，本文], [10], [明朝体],
      [#text(9pt, "参考文献")], [9], [明朝体],
    )
  ) <tab:fonts>
```
table の columns の数に応じて，文字列の配列が自動的に整列されます．
`stroke: none` は枠線を消しています．`table.hline()` を挟むとその位置に横線を引けます．
ここで，`gothic` は `lib.typ` で定義されています．
他のテンプレートを使用する場合には注意をしてください．
```typ
  #import "libs/rsj-conf/lib.typ": rsj-conf, gothic
```

== 定理環境
@def:definition1 や @lem:lemma1 などは以下で記述されております．

```typ
  #definition("用語 A")[
    用語 A の定義を書きます．
  ]<def:definition1>
  #lemma[
    補題を書きます．タイトルは省略することもできます．
  ]<lem:lemma1>
  #lemma("補題 C")[
    補題を書きます．番号は定義や補題ごとに 1 からカウントします．
  ]<lem:lemma2>
  #theorem("定理 D")[
    ここに定理を書きます．
  ]<thm:theorem1>
  #corollary[
    系を書きます．@def:definition1 のように，ラベルで参照することもできます．
  ]
  #proof([@thm:theorem1 の証明])[
    証明を書きます．証明終了として□印をつけています．
  ]
```

ここで，`definition`, `lemma`, `theorem`, `corollary`, `proof` は `gothic` と同様に `lib.typ` で定義されています．
他のテンプレートを使用する場合には注意をしてください．
```typ
  #import "libs/rsj-conf/lib.typ": rsj-conf, gothic
```
さらに元をたどると `lib.typ` で ctheorems パッケージ (https://typst.app/universe/package/ctheorems) をインポートして使用しております．

```typ
  // Theorem environment
  #import "@preview/ctheorems:1.1.3": thmplain, thmproof, thmrules
  #let thmjp = thmplain.with(base: {}, separator: [#h(0.5em)], titlefmt: strong, inset: (top: 0em, left: 0em))
  #let definition = thmjp("definition", text(font: gothic)[定義])
  #let lemma = thmjp("lemma",text(font: gothic)[補題])
  #let theorem = thmjp("theorem", text(font: gothic)[定理])
  #let corollary = thmjp("corollary",text(font: gothic)[系])
  #let proof = thmproof("proof", text(font: gothic)[証明], separator: [#h(0.9em)], titlefmt: strong, inset: (top: 0em, left: 0em))
```

== 参考文献
参考文献は `refs.yml` に記載してください．
Hayagriva という YAML 形式のフォーマットに従っています．
編集するだけであれば特に解説する必要はないと思います．
詳細が気になる方は https://github.com/typst/hayagriva をご参照ください．
参考文献の体裁は `libs/rsj-conf/bib.csl` で制御しています．
これは Citation Style Language という XML 形式で記述されております．
CSL ファイルは著者が編集する必要はありませんが，詳細が気になる方は https://citationstyles.org/ をご参照ください．
日本語論文として重要な点は，CSL ファイルでは Hayagriva で記述された `language` の属性を見て，著者表示を"カンマ区切りのみ"にするか"カンマ区切り+最終著者の前にand" にするかを決定している点です．
したがって，英語文献だけでしたら YAML ファイルの代わりに bib ファイルも使用することができます．

文献内で引用された順番にフォーマットを整えて自動で参考文献の章が作られます．
引用の方法については後述します．
完成原稿では推奨されませんが，引用されていない論文も記載したい場合には full: true にすれば，すべての文献が出力されます．

== 引用
引用は "\@label" と記述することで，数式であれば @eq:system，図であれば @fig:quadratic，表であれば @tab:fonts，参考文献であれば @kimura2015asymptotic のように表示されます．
参考文献は連続して引用すると @kimura2017state @kimura2021control @kimura2020facility @khalil2002control @sugie1999feedback @shimz2022visually と繋げられて表示されます．
文法上では特に規則はありませんが，個人的にはラベルの命名規則として，図の場合には "fig:" から，表の場合には"tab:" から始めるようにラベル名を設定しており，参考文献のラベルは "著者名発行年タイトルの最初の単語"で名付けております．

= おわりに
筆者の理解や表現が誤っている箇所もあるかと思います．
#link("https://github.com/kimushun1101/typst-jp-conf-template")[GitHub] を通して，Issues や Pull Reqests を歓迎しております．
日本語での投稿で構いません．
誤字脱字や文法，表現など細かい修正でも大変ありがたいです．
筆者は，Typst が普及するためには学会のフォーマットで配布されることが不可欠だと感じています．
異なる学会のフォーマットも随時 `libs` ディレクトリに追加していこうと思っております．
これらのファイルがTypst が普及の一助となれば幸いです．

= 謝辞
謝辞には章番号が振られないように設定しております．
「この研究は☆☆☆の助成を受けて行われました．」や「〇〇〇大学との共同研究です．」
みたいな文章が書かれることを想定しています．
最後までお読みいただき誠にありがとうございました．

#bibliography("refs.yml", full: false)

#show: appendix

= 付録の書き方
参考文献の後ろに付録を付けたい場合には、
```typ
  #show: appendix
```
を追加してください。
その場所に「付録」という文字が挿入されます。
それ以降に見出しを書くことで、章番号がアルファベット順の見出しがつきます。

= 付録に複数のセクションがある場合
2つ目のセクションはBとなります。

== サブセクションの番号
サブセクションはB.1のようになります。
図はセクションアルファベットとリセットされた図番号が組み合わさります。

#figure(
  placement: bottom,
  image("figs/quadratic.svg", width: 90%),
  caption: [$x^2$ のグラフ],
) <fig:appendix>
