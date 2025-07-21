// Exemplo de desenvolvimento usando a template easy-unb
// Copyright (C) 2025 Luiz Georg
// SPDX-License-Identifier: MIT-0

#import "@preview/easy-unb:0.1.0": tabela

= Desenvolvimento

Essa template segue requisitos da UnB e da ABNT.

#let table-data = csv("../resources/tables/exemplo.csv")

#tabela(
  caption: [Exemplo de uma tabela no Typst usando um arquivo csv],
  fonte: [Autor],
  nota: [Nota: notas arbitrárias podem ser adicionadas à tabela.],
  columns: 3,
  table.header(..table-data.at(0)),
  ..table-data.slice(1).join(),
)
