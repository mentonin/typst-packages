// Folha de aprovação - Elemento obrigatório - NBR 14724:2011 4.2.1.3
// Copyright (C) 2025 Luiz Georg
// SPDX-License-Identifier: AGPL-3.0-or-later

#import "folha-de-rosto.typ": descricao

#let assinatura(person) = {
  stack(spacing: 0.8em, line(length: 60%), [*#person.nome*], person.titulo)
}

#let print(conf) = {
  // Constituída pelos elementos - NBR 14724:2011 4.2.1.3:
  // a) Nome do autor;
  // b) Título do trabalho;
  // c) Subtítulo se houver;
  // d) Natureza/descrição;
  // e) Data de aprovação;
  // f) Nome, titulação, assinatura, e instituição dos compenentes da banca;

  pagebreak(weak: true)

  set align(center)
  stack(
    conf.autor, // a)
    1fr,
    conf.titulo, // b)
    2em,
    conf.subtitulo, // c)
    1fr,
    descricao(conf), // e)
    1fr,
    stack(..(conf.orientador + conf.banca).map(assinatura), spacing: 3em), // f)
    1fr,
    conf.cidade, // g)
    0.8em,
    conf.data.display("[day]/[month]/[year]"), // h)
  )
}
