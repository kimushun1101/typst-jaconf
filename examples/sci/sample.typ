// MIT No Attribution
// Copyright 2024 Shunsuke Kimura

#import "lib.typ": sci, definition, lemma, theorem, corollary, proof, appendix

#show: sci.with(
  title: [システム制御情報研究発表講演会用Typstテンプレート], 
  title-en: [Typst Template for ISCIE Conferences],
  authors: [著者の所属　◯ 著者 氏名，共著 者],
  authors-en: [A. First and B. Second \ Affiliation of the author(s) ],
  abstract: [This is the Typst template file for SCI25. This template is prepared to support document creation. Some formats such as margins, title, sections, and body text styles are pre-set for documents written in Japanese. Authors can change formats as necessary within the following submission guidelines. All papers must be written in English or Japanese. The paper must be in two column A4 format with the length 2 to 8 pages. The margins must be set larger than the specified sizes [1]. In SCI25, the proceedings will be downloaded PDF file. The total file size for a paper should not exceed a total of 10MB. The other templates are also available on the SCI25's web site. ],
  // Noto Sansフォントがない場合には、適宜変更してください。
  // Windowsでは"MS PGothic"、Mac OSでは"Hiragino Kaku Gothic Pro"が標準で使用可能です。
  // Linuxでは"Noto Sans CJK JP"やその他のフォントをインストールして使用するとよいでしょう。
  font-gothic: "Noto Sans CJK JP", // "MS PGothic", "Hiragino Kaku Gothic Pro", "BIZ UDPGothic", "IPAexGothic"
  font-mincho: "Noto Serif CJK JP", // "MS PMincho", "Hiragino Mincho Pro", "BIZ UDPMincho", "IPAexMincho"
  font-latin: "New Computer Modern",
)

#let typst-version = "v0.14"

= はじめに

システム制御情報学会研究発表講演会用のTypstテンプレート`lib.typ`は，Typst #typst-version; での編集を想定し，2024年度のSCI24用のWord，LaTeXテンプレートを元に，2025年度のSCI25用に新規作成したものです．
題目，著者名などの書き方の参考例としてお使い下さい．余白や表題，章，本文のスタイルなど一部の書式は設定されていますが，適切に設定されていない書式もあるかもしれません．
必要に応じて書式を変更してご利用ください．
本サンプルは https://github.com/kimushun1101/typst-jp-conf-template を元に作成されており，
この原稿のソースコードは https://github.com/kimushun1101/sci25-typst で公開しております．
Typst の概要についてお知りになりたい方は，https://github.com/kimushun1101/How-to-use-typst-for-paper-jp にもスライド形式の資料を用意しておりますので，ぜひこちらもご覧ください．

テンプレートファイルは以下の２つの方法で実行できることを確認しています．
README.md に従い，コンパイルできる環境を用意してください．
+ VS Code とその拡張機能を使う．
+ Typst app にアップロードする．
+ CLI (Command Line Interface) でコンパイルする．

= 原稿の体裁

== レイアウトとフォント
原稿の体裁は，基本的には https://sci24.iscie.or.jp/info/cfp/page_layout.pdf に従っております．

用紙サイズは A4，余白は上 2.5 cm，下 3 cm，左 1.8 cm，右 1.8 cm とします．
タイトル，著者，アブストラクトは1段組みで，本文は2段組みです．
アブストラクトは左右に 1 cm 余白を取っています．

フォントの設定は @tab:fonts の通りです．
ここで，ゴシック体とは "BIZ UDPGothic", "MS PGothic", "Hiragino Kaku Gothic Pro", "IPAexGothic", "Noto Sans CJK JP" のいずれか，明朝体とは "BIZ UDPMincho", "MS PMincho", "Hiragino Mincho Pro", "IPAexMincho", "Noto Serif CJK JP" のいずれかで見つかるものが採用されます．
これらのフォントがお使いのコンピュータになければインストールするか，代わりに使いたいフォントがあれば`lib.typ`の最初の部分に記載されているソースコードに追加してください．
以下のコマンドで使用可能なフォント一覧を確認できます．
```sh
typst fonts
```
また，インストールされていないフォントが混ざっているとWarningを出すため，コンパイル自体は問題なく行えますが，気になる方は未インストールのフォントの記述を削除してください．
```typst
// Set the Fonts
#let gothic = ("BIZ UDPGothic", "MS PGothic", "Hiragino Kaku Gothic Pro", "IPAexGothic", "Noto Sans CJK JP")
#let mincho = ("BIZ UDPMincho", "MS PMincho", "Hiragino Mincho Pro", "IPAexMincho", "Noto Serif CJK JP")
#let english = ("Times New Roman", "New Computer Modern")

// example 1: Windows
// #let gothic = ("MS PGothic")
// #let mincho = ("MS PMincho")
// #let english = ("Times New Roman")

// example 2: Mac OS
// #let gothic = ("Hiragino Kaku Gothic Pro")
// #let mincho = ("Hiragino Mincho Pro")
// #let english = ("Times New Roman")

// example 3: Linux or Typst app
// #let gothic = ("Noto Sans CJK JP")
// #let mincho = ("Noto Serif CJK JP")
// #let english = ("New Computer Modern")
```
例えば，2, 3 行目をコメントアウトして，5, 6 行目のコメントアウトを外すなど対応していただいても構いません．

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
    [#text(14pt, "タイトル")], [14], [ゴシック体],
    [#text(10.5pt, "著者名")], [10.5], [ゴシック体],
    [#text(12pt, "章タイトル")], [12], [ゴシック体],
    [節，小節，本文], [10.5], [明朝体],
    [#text(10.5pt, "参考文献")], [10.5], [明朝体],
  )
) <tab:fonts>

== 数式・図・表
数式番号は @eq:system のように数式の右側に， 図のタイトルは "@fig:quadratic タイトル名"のように図の下部に，表のタイトルは "@tab:fonts タイトル名" のように図の上部につきます．

== 定理環境
以下は，theorem 環境の使用例です．
現バージョンでは日本語に太字が使えない変わりに，フォントをゴシックにして対応しています．

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

= 編集の仕方

== 論文情報の編集
main.typ の文頭にある以下のコードを解説します．
```typ
#import "lib.typ": sci, definition, lemma, theorem, corollary, proof, appendix

// デフォルト値でよい引数は省略可能
#show: sci.with(
  title: [システム制御情報研究発表講演会用Typstテンプレート], 
  title-en: [Typst Template for ISCIE Conferences],
  authors: [著者の所属　◯ 著者 氏名，共著 者],
  authors-en: [A. First and B. Second \ Affiliation of the author(s) ],
  abstract: [This is ...],
)
```
1 行目はこの原稿の体裁を設定するためのソースコードを import しています．
2 行目では，1行目で読み込んだ関数を使用して，原稿体裁を作成しています．
3, 4 行目では日英のタイトルを，5, 6行目では著者一覧を，7 行目ではアブストラクトを記載します．
各内容の中で改行をしたい場合には，`\` で改行してください．
英語原稿の場合には`title`と`authors`をコメントアウトしてください．

そのあとに，ソースコードブロックを表示するためのパッケージと定理環境の整備のための外部パッケージの設定を行っており，
`= はじめに`
以降の部分が本文となります．
本文の部分を取り除いたテンプレートとして`main.typ`を用意しました．
そちらに原稿を執筆いただければと思います．

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
本テンプレート作成時の Typst のバージョンでは，PNG, JPEG, GIF, SVG の形式のイメージデータを挿入することができます．
例としては以下の通りです．
```typ
#figure(
  placement: top,
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
  placement: top,
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
    [#text(14pt, "タイトル", font: gothic)], [14], [ゴシック体],
    [#text(10.5pt, "著者名", font: gothic)], [10.5], [ゴシック体],
    [#text(12pt, "章タイトル")], [12], [ゴシック体],
    [節，小節，本文], [10.5], [明朝体],
    [#text(10.5pt, "参考文献")], [10.5], [明朝体],
  )
) <tab:fonts>
```
table の columns の数に応じて，文字列の配列が自動的に整列されます．
`stroke: none` は枠線を消しています．`table.hline()` を挟むとその位置に横線を引けます．
ここで，`gothic` はこのファイル内で定義されています．
他のテンプレートを使用する場合には注意をしてください．
```typ
#import "lib.typ": sci, definition, lemma, theorem, corollary, proof, appendix
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

== 参考文献
参考文献は `refs.yml` に記載してください．
Hayagriva という YAML 形式のフォーマットに従っています．
参考文献の体裁は `sci.csl` で制御しています．
日本語論文として重要な点は，CSL ファイルでは Hayagriva で記述された `language` の属性を見て，著者表示を"カンマ区切りのみ"にするか"カンマ区切り+最終著者の前にand" にするかを決定している点です．
したがって，英語文献だけでしたら YAML ファイルの代わりに bib ファイルも使用することができます．

文献内で引用された順番にフォーマットを整えて自動で参考文献の章が作られます．
引用の方法については後述します．
完成原稿では推奨されませんが，引用されていない論文も記載したい場合には full: true にすれば，すべての文献が出力されます．

== 引用
引用は "\@label" と記述することで，数式であれば @eq:system，図であれば @fig:quadratic，表であれば @tab:fonts，参考文献であれば @internationaljournal のように表示されます．
参考文献は連続して引用すると @japanesejournal @internationalconference @japaneseconference @englishbook @japanesebook @sci25webpage と繋げられて表示されます．
文法上では特に規則はありませんが，ラベルの命名規則の例として，図の場合には "fig:" から，表の場合には"tab:" から始めるようにラベル名を設定しており，識別や検索をしやすくしておくとよいでしょう．

= おわりに
SCI25 の Typst を作成させていただきました．
まだ至らぬ部分も多々あるかと思います．
#link("https://github.com/kimushun1101/typst-jp-conf-template")[GitHub] には，他の学会のテンプレートも保管しております．
不具合や不明点がありましたら，Issues や Pull Reqests へご報告いただけますと幸いです．
誤字脱字や文法，表現など細かい修正でも大変ありがたいです．日本語での投稿でも構いません．
GitHubのハードルが高ければ，製作者 #link("mailto:kimushun1101@gmail.com") へ直接ご連絡いただいても喜びます．
皆様とご協力させていただき Typst 普及の一助となれば幸いです．

= 謝辞
謝辞には章番号が振られないように設定しております．
「この研究は☆☆☆の助成を受けて行われました．」や「〇〇〇大学との共同研究です．」などの文章が書かれることを想定しています．

#bibliography("refs.yml", full: false)

