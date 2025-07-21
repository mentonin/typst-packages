// Document template for UnB using easy-unb
// Copyright (C) 2025 Luiz Georg
// SPDX-License-Identifier: MIT-0

#import "@preview/easy-unb:0.1.0": tcc-unb

#show: tcc-unb.with(
  titulo: [Modelo de TCC],
  subtitulo: [Uma template Typst para a Universidade de Brasília],
  autor: "Nome do Autor",
  palavras-chave: ("palavra-chave1", "palavra-chave2", "palavra-chave3"),
  orientador: (
    (nome: "Prof. Dr. Oráculo da Silva", titulo: "Orientador"),
    (nome: "Profa. Dra. Vidente Alves", titulo: "Co-orientadora"),
  ),
  banca: (
    (nome: "Profa. Dra. Agatha Correia", titulo: "Examinadora"),
    (nome: "Prof. Dr. Severino Holmes", titulo: "Examinador"),
  ),
  departamento: (
    nome: [Nome do Departamento],
    sigla: [DEPTO],
  ),
  curso: [Nome do Curso],
  resumo: include "pre-textual/resumo.typ",
  abstract: include "pre-textual/abstract.typ",

  // Elementos opcionais
  dedicatoria: include "pre-textual/dedicatoria.typ",
  agradecimentos: include "pre-textual/agradecimentos.typ",
  epigrafe: include "pre-textual/epigrafe.typ",
)

#include "textual/introducao.typ"
#include "textual/desenvolvimento.typ"
#include "textual/conclusao.typ"

// === Referências ===
// Obrigatório - NBR 14724:2011 4.2.3.1
// Deve vir depois de todos os elementos textuais
#bibliography("bibliografia.bib")
