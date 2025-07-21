// Formatting template for UnB
// Copyright (C) 2025 Luiz Georg
// SPDX-License-Identifier: AGPL-3.0-or-later

#import "@preview/hydra:0.6.1": hydra
#import "@preview/glossarium:0.5.8": make-glossary, print-glossary, register-glossary

#import "conf-parser.typ"
#import "cover.typ"
#import "outlines.typ"
#import "resumos.typ"
#import "folha-de-rosto.typ"
#import "folha-de-aprovacao.typ"

#let tcc-unb(
  doc,
  ..args,
) = {
  let conf = conf-parser.parse(args)

  // === Colors ===
  let verde-unb = cmyk(100%, 0%, 100%, 20%)
  let azul-unb = cmyk(100%, 65%, 0%, 35%)

  // === Document Metadata ===
  set document(
    title: conf.titulo,
    author: conf.autor,
    keywords: conf.palavras-chave,
    date: conf.data,
  )
  set text(
    lang: "pt",
    region: "BR",
  )
  set bibliography(style: "associacao-brasileira-de-normas-tecnicas")
  if "glossario" in conf {
    show: make-glossary
    register-glossary(conf.glossario)
  }

  // === Geometry ===
  set page(
    // NBR 14724:2011 5.1
    paper: "a4",
    margin: (
      top: 3cm,
      inside: 3cm,
      bottom: 2cm,
      outside: 2cm,
    ),
  )

  // NBR 14724:2011 5.2.1
  set footnote.entry(
    separator: line(length: 5cm, stroke: 0.5pt),
    clearance: 1em,
  )
  show footnote.entry: set text(size: 10pt)

  // === Fonts ===
  set text(
    font: "STIX Two Text",
    size: 12pt, // NBR 14724:2011 5.1
    fallback: false,
  )
  show math.equation: set text(font: "STIX Two Math")
  show table: set text(font: "Nimbus Sans")
  show heading: set text(font: "Nimbus Sans")

  set par(
    first-line-indent: (amount: 2.3cm, all: true),
    leading: 0.75em, // Espaçamento 1.5 (ish) - NBR 14724:2011 5.2
    spacing: 0.75em, // Idem acima
    justify: true,
    linebreaks: "optimized",
  )

  set figure(placement: auto)
  // NBR 14724:2011 4.2.1.9 e 4.2.1.10
  set figure.caption(position: top, separator: [ --- ])
  show figure.caption: set text(size: 10pt)

  show table: set par(leading: 0.65em)
  show table: set align(center + horizon)
  set table(stroke: none)

  // NBR 14724:2011 5.2.2
  show heading: set block(below: 1.5em, above: 1.5em)
  show heading.where(level: 1): it => {
    pagebreak(weak: true, to: "odd")
    it
  }
  // NBR 14724:2011 5.2.3
  show heading.where(numbering: none): set align(center)

  // === Numbering ===
  set heading(numbering: "1.1")

  // === Capa ===
  // Obrigatório - NBR 14724:2011 4.1.1
  cover.print(conf)

  // === Folha de rosto ===
  // Obrigatório - NBR 14724:2011 4.2.1.1.1
  folha-de-rosto.print(conf)

  // === Ficha catalográfica ===
  // Obrigatório - NBR 14724:2011 4.2.1.1.2
  {
    pagebreak(weak: true)
    // TODO
    [ficha catalográfica]
  }

  // === Errata ===
  // Opcional - NBR 14724:2011 4.2.1.2
  // TODO: remover? - acrescida depois de impresso - NBR 14724:2011 4.2.1.2
  if ("errata" in conf) {
    heading(numbering: none, outlined: false)[Errata]
    errata
  }

  // === Folha de Aprovação ===
  // Obrigatório - NBR 14724:2011 4.2.1.3
  folha-de-aprovacao.print(conf)

  // === Dedicatória ===
  // Opcional - NBR 14724:2011 4.2.1.4
  if ("dedicatoria" in conf) {
    pagebreak(weak: true)
    conf.dedicatoria
  }

  // === Agradecimentos ===
  // Opcional - NBR 14724:2011 4.2.1.5
  if ("agradecimentos" in conf) {
    pagebreak(weak: true)
    set par(leading: 0.65em, spacing: 0.65em)
    conf.agradecimentos
  }

  // === Epígrafe ===
  // Opcional - NBR 14724:2011 4.2.1.6
  if ("epigrafe" in conf) {
    pagebreak(weak: true)
    conf.epigrafe
  }

  // === Resumo/Abstract ===
  // Obrigatório - NBR 14724:2011 4.2.1.7 e 4.2.1.8
  resumos.print(conf)

  // Listas/Sumários
  outlines.print-pre(conf)

  // === Documento ===
  {
    pagebreak(weak: true)
    // NBR 14724:2011 5.3
    set page(
      header: context {
        set text(size: 10pt, style: "italic")
        set block(spacing: 0.5em)
        set par(first-line-indent: 0em)
        let page-is-odd = calc.odd(here().page())
        set align(center)
        box(width: 100%)[
          #if page-is-odd [
            #h(1fr)
            #hydra(2)
            #h(1fr)
            #counter(page).display("1")
          ] else [
            #counter(page).display("1")
            #h(1fr)
            #hydra(1)
            #h(1fr)
          ]
          #line(length: 100%, stroke: 0.25mm)
        ]
      },
      header-ascent: 1cm - 1em,
    )
    set terms(separator: [: ])

    doc
  }

  // === Glossário ===
  // Opcional - NBR 14724:2011 4.2.3.2
  // TODO
  {
    [Glossário]
  }

  // === Apêndices ===
  // Opcional - NBR 14724:2011 4.2.3.3
  // TODO
  {
    [Apêndices]
  }

  // === Anexos ===
  // Opcional - NBR 14724:2011 4.2.3.4
  // TODO
  {
    [Anexos]
  }

  // === Índice ===
  // Opcional - NBR 14724:2011 4.2.3.5
  // TODO
  {
    [Índice]
  }
}
