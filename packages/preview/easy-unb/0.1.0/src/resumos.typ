// Resumos em português e inglês - Elemento obrigatório - NBR 14724:2011 4.2.1.7 e 4.2.1.8
// Copyright (C) 2025 Luiz Georg
// SPDX-License-Identifier: AGPL-3.0-or-later

#let pagina-resumo(texto, kws, lang) = {
  let titulo
  let kw-name
  if (lang == "en") {
    titulo = "Abstract"
    kw-name = "Keywords"
  } else if (lang == "pt") {
    titulo = "Resumo"
    kw-name = "Palavras chave"
  }
  set par(first-line-indent: 0em)
  heading(numbering: none, outlined: false, titulo)
  [
    #texto

    *#kw-name:* #kws.join("; "). // NBR 6028:2021 4.1.7
  ]
}

#let print(conf) = {
  if conf.resumo != none {
    pagina-resumo(conf.resumo, conf.palavras-chave, "pt")
  }
  if conf.abstract != none {
    pagina-resumo(conf.abstract, conf.palavras-chave, "en")
  }
}
