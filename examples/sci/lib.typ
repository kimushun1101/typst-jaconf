// MIT No Attribution
// Copyright 2024, 2025 Shunsuke Kimura

#let conference-name = "システム制御情報学会 研究発表講演会"
#import "@preview/jaconf:0.6.0": jaconf, definition, lemma, theorem, corollary, proof, appendix

#let sci(
  title: [日本語タイトル],
  title-en: [],
  authors: [著者],
  authors-en: [],
  abstract: none,
  keywords: (),
  font-gothic: "Noto Sans CJK JP",
  font-mincho: "Noto Serif CJK JP",
  font-latin: "New Computer Modern",
  body
) = {
  show: jaconf.with(
    // 基本 Basic
    title: title,
    title-en: title-en,
    authors: authors,
    authors-en: authors-en,
    abstract: abstract,
    keywords: keywords,
    // フォント名 Font family
    font-heading: font-gothic,
    font-main: font-mincho,
    font-latin: font-latin,
    // 外観 Appearance
    paper-margin: (top: 20mm, bottom: 27mm, left: 20mm, right: 20mm),
    paper-columns: 2,  // 1: single column, 2: double column
    page-number: none,  // e.g. "1/1"
    column-gutter: 4%+0pt,
    spacing-heading: 1.2em,
    front-matter-order: ("title", "title-en", "authors", "authors-en", "abstract"), // "keywords"はSCI25では使用しません。
    front-matter-spacing: 1.5em,
    front-matter-margin: 2.0em,
    abstract-language: "en",  // "ja" or "en"
    keywords-language: "en",  // "ja" or "en"
    bibliography-style: bytes(read("sci.csl")),
    // 見出し Headings
    heading-abstract: [*Abstract--*],
    // heading-keywords: [*Keywords*: ], // "keywords"はSCI25では使用しません。
    heading-bibliography: [参考文献],
    heading-appendix: [付録],
    // フォントサイズ Font size
    font-size-title: 16pt,
    font-size-title-en: 12pt,
    font-size-authors: 12pt,
    font-size-authors-en: 12pt,
    font-size-abstract: 10pt,
    font-size-heading: 12pt,
    font-size-main: 10pt,
    font-size-bibliography: 10pt,
    // 補足語 Supplement
    supplement-image: [図],
    supplement-table: [表],
    supplement-separator: [: ],
  )
  body
}
