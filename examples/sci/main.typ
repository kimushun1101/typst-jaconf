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

= はじめに
