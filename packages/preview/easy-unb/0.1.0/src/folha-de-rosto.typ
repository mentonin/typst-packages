// Folha de rosto - Elemento obrigatório - NBR 14724:2011 4.2.1.1
// Copyright (C) 2025 Luiz Georg
// SPDX-License-Identifier: AGPL-3.0-or-later

#let descricao(conf) = {
  // NBR 14724:2011 4.2.1.1.1 e)
  // Contém natureza, objetivo, instituição, área de concentração
  // Espaçamento à direita - NBR 14724:2011 5.2
  set align(right)
  block(
    width: 50%,
    align(left)[
      Monografia submetida ao curso de graduação em #conf.curso da #conf.instituicao.nome, como requisito parcial para obtenção do Título de Bacharel em #conf.curso.
    ],
  )
}

#let print(conf) = {
  pagebreak(weak: true)
  counter(page).update(1)

  // Exibe os elementos em ordem - NBR 14724:2011 4.2.1.1.1:
  // a) Nome do autor;
  // b) Título do trabalho;
  // c) Subtítulo se houver;
  // d) Número de volume se houver mais de um;
  // e) Descrição (natureza, objetivo, instituição, área de concentração);
  // f) Nome do orientador e, se houver, do coorientador;
  // g) Cidade da instituição;
  // h) Ano de depósito.

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
    stack(..conf.orientador.map(el => [#el.titulo: #el.nome]), spacing: 1em), // f)
    1fr,
    conf.cidade, // g)
    0.8em,
    conf.data.display("[year]"), // h)
  )
}
