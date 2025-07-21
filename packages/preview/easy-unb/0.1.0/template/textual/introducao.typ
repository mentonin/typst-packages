// Exemplo de introdução usando a template easy-unb
// Copyright (C) 2025 Luiz Georg
// SPDX-License-Identifier: MIT-0

#let latex = {
  set text(font: "New Computer Modern")
  let l = "L"
  let a = text(baseline: -0.35em, size: 0.66em, "A")
  let t = "T"
  let e = text(baseline: 0.22em, "E")
  let x = "X"
  box(l + h(-0.32em) + a + h(-0.13em) + t + h(-0.14em) + e + h(-0.14em) + x)
}
= Introdução

Essa template foi criada como uma alternativa a templates em #latex.
