// Configuration parser for the easy-unb package
// Copyright (C) 2025 Luiz Georg
// SPDX-License-Identifier: AGPL-3.0-or-later

#let defaults = (
  instituicao: (
    nome: "Universidade de Brasília",
    sigla: "UnB",
  ),
  cidade: "Brasília, DF",
  data: datetime.today(),
)

#let person(nome: "orientador", titulo: "tipo") = (
  nome: nome,
  titulo: titulo,
)

#let parse-person(arg, default-title: "Orientador(a)") = {
  if type(arg) == str {
    arg = [#arg]
  }
  if type(arg) == content {
    return (person(nome: arg, titulo: default-title),)
  }
  if type(arg) == dictionary {
    return (person(..arg),)
  }
  if type(arg) == array {
    return arg.map(parse-person.with(default-title: default-title)).sum()
  }
}

#let parse-sigla(arg) = {
  arg.full = arg.nome
  if "sigla" in arg {
    arg.full = [#arg.full --- #arg.sigla]
  }
  return arg
}

#let parse(args) = {
  let res = defaults + args.named()
  res.orientador = parse-person(res.at("orientador"))
  res.banca = parse-person(res.at("banca"), default-title: "Examinador(a)")
  res.instituicao = parse-sigla(res.instituicao)
  res.departamento = parse-sigla(res.departamento)
  res.titulo-completo = res.titulo + if "subtitulo" in res [: #res.subtitulo]
  return res
}
