// Capa - Elemento obrigatório - NBR 14724:2011 4.1.1
// Copyright (C) 2025 Luiz Georg
// SPDX-License-Identifier: AGPL-3.0-or-later

#let print(conf) = {
  set page(
    background: image(
      "resources/capa.svg",
      height: 100%,
      width: 100%,
      fit: "cover",
    ),
    margin: 0cm,
  )

  // Exibe os elementos em ordem - NBR 14724:2011 4.1.1:
  // a) Nome da instituição (opcional);
  // b) Nome do autor;
  // c) Título;
  // d) Subtítulo se houver, separado por dois pontos;
  // e) Número de volume se houver mais de um;
  // f) Cidade da instituição;
  // g) Ano de depósito.

  grid(
    rows: (35.4%, 43%, 1fr),
    columns: 100%,
    align: center,
    inset: (x: 3cm, y: 0cm),

    [], // Logo
    stack(
      0.5cm,
      text(weight: "bold", conf.instituicao.full), // a)
      1fr,
      text(conf.autor), // b)
      1fr,
      text(weight: "black", conf.titulo-completo), // c) e d)
      4fr,
    ),
    {
      set text(fill: white)
      stack(
        1fr,
        conf.cidade, // f)
        0.8em,
        conf.data.display("[year]"), // g)
        2cm,
      )
    }, // Bottom banner
  )
}
