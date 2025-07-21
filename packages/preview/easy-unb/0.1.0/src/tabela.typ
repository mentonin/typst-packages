// Table formatting functions
// Copyright (C) 2025 Luiz Georg
// SPDX-License-Identifier: AGPL-3.0-or-later

#import "@preview/tblr:0.3.1"

// Normas de Apresentação Tabular - IBGE, 1993
#let tabela(
  titulo: none,
  fonte: [Usar argumento `fonte` da função `tabela`. Obrigatório mesmo se criado pelo autor],
  nota: none,
  ..args,
) = {
  let remark = [Fonte: #fonte.] + if nota != none [\ #nota]
  set text(font: "Nimbus Sans", size: 10pt)
  tblr.tblr(
    stroke: none,
    column-gutter: 0.6em,
    caption: titulo,
    remarks: text(size: 10pt, remark),
    // booktabs style rules
    tblr.rows(within: "header", auto, inset: (y: 0.5em)),
    tblr.rows(within: "header", auto, align: center, hooks: strong),
    tblr.hline(within: "header", y: 0, stroke: 0.08em),
    tblr.hline(within: "header", y: end, position: bottom, stroke: 0.05em),
    tblr.rows(within: "body", 0, inset: (top: 0.5em)),
    tblr.hline(y: end, position: bottom, stroke: 0.08em),
    tblr.rows(end, inset: (bottom: 0.5em)),
    ..args,
  )
}
