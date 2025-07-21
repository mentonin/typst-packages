// Listas de elementos do texto - NBR 14724:2011 4.2.1.9 a 4.2.1.13
// Copyright (C) 2025 Luiz Georg
// SPDX-License-Identifier: AGPL-3.0-or-later

// === Lista de Ilustrações ===
// Opcional - NBR 14724:2011 4.2.1.9
#let outline-figuras = outline.with(title: "Lista de Ilustrações", target: figure.where(
  kind: image,
))

// === Lista de Tabelas ===
// Opcional - NBR 14724:2011 4.2.1.10
#let outline-tabelas = outline.with(title: "Lista de Tabelas", target: figure.where(
  kind: table,
))

// === Lista de Abreviaturas e Siglas ===
// Opcional - NBR 14724:2011 4.2.1.11
// TODO: Formatar e melhorar interface
#let outline-siglas(glossario) = {
  if glossario != none {
    heading(numbering: none)[Lista de Abreviaturas e Siglas]
    let a(..args) = []
    let title(entry) = [*#entry.short* --- #entry.long]
    print-glossary(
      glossario,
      disable-back-references: true,
      groups: ("sigla",),
      user-print-group-heading: a,
      user-group-break: a,
      user-print-title: title,
    )
  }
}

// === Lista de Símbolos ===
// Opcional - NBR 14724:2011 4.2.1.12
// TODO: Formatar e criar interface
#let outline-symbols() = [
  #heading(numbering: none, outlined: false, "Lista de símbolos")
  Lista de símbolos
]

#let print-pre(conf) = {
  show outline: it => if query(it.target) != () { it }
  outline-figuras()
  outline-tabelas()
  if "glossario" in conf { outline-siglas(conf.glossario) }
  outline-symbols()

  // === Sumário ===
  // Obrigatório - NBR 14724:2011 4.2.1.13
  // TODO: Verificar NBR 6027
  outline()
}
