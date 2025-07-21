<!-- Copyright (C) 2025 Luiz Georg
SPDX-License-Identifier: AGPL-3.0-or-later -->

# easy-unb

Esse pacote é uma template para TCCs da Universidade de Brasília (UnB) usando o Typst.
Ele é baseado nas templates existentes para LaTeX, particularmente a excelente [unbtex](https://ctan.org/pkg/unbtex).

## Referências consultadas

- NBR 6024:2012
- NBR_6027:2012
- NBR_6028:2021
- NBR 14724:2011
- Normas de Apresentação Tabular - IBGE, 1993
- [unbtex](https://ctan.org/pkg/unbtex) (Classe e template de TCC da UnB para LaTeX)

## Como usar essa template

Você pode usar essa template no [Typst Online](https://typst.app) clicando em “Start from template” no painel inicial e procurando por `easy-unb`.

Alternativamente, você pode usar a CLI para iniciar um projeto local com essa template:

```bash
typst init @preview/easy-unb
```

Para usar o pacote sem usar a template, basta usar os seguintes comandos no seu arquivo Typst:

```typst
#import "@preview/easy-unb:0.1.0": tcc-unb

#show: tcc-unb.with(
  // ...
)
```

A função `tcc-unb` aceita os seguintes parâmetros:

- `titulo`: Título do trabalho.
- `subtitulo` _(opcional)_: Subtítulo do trabalho.
- `autor`: Nome do autor.
- `orientador`: Orientador ou uma lista de orientadores [^pessoa].
- `banca`: Lista de examinadores [^pessoa].
- `instituicao` _(default: UnB)_: Instituição de ensino [^sigla].
- `cidade` _(default: Brasília)_: Cidade da instituição.
- `departamento`: Departamento do autor [^sigla].
- `curso`: Nome do curso.
- `resumo`: Texto do resumo em português.
- `palavras-chave`: Lista de palavras-chave em português.
- `abstract`: Texto do resumo em inglês.
- `keywords`: Lista de palavras-chave em inglês.
- `data` _(default: data atual)_: Data de defesa do trabalho.
- `dedicatoria` _(opcional)_: Texto da dedicatória.
- `agradecimentos` _(opcional)_: Texto dos agradecimentos.
- `epigrafe` _(opcional)_: Texto da epígrafe.

[^pessoa]: Pode ser uma string, ou um objeto com os campos `nome` e `titulo` _(opcional)_ (para personalizar gênero, por exemplo), ou uma lista de tais objetos.

[^sigla]: Pode ser uma string com o nome por extenso, ou um objeto com os campos `nome` e `sigla` _(opcional)_.

### Outras funções

O pacote também fornece uma função auxiliar, chamada `tabela`, que facilita a criação de tabelas no formato exigido pela UnB/ABNT, que seguem o padrão do IBGE (Normas de Apresentação Tabular - IBGE, 1993).

```typst
#import "@preview/easy-unb:0.1.0": tabela

#tabela(
  titulo: [Título da tabela],
  fonte: [Fonte da tabela],
  nota: [
    Nota: notas arbitrárias podem ser adicionadas à tabela.
    Além disso, `tabela` é um wrapper para a função `tblr` do pacote `@preview/tblr:0.3.1`, e argumentos extras são repassados para essa função.
    Verificar a documentação do pacote `@preview/tblr` para mais detalhes.
  ],
  columns: 3,
  // Dados da tabela
  table.header([Planeta], [Massa ($10^24$ kg)], [Período Orbital (dias)]),
  [Terra], [5.972], [365.2],
  [Marte], [0.642], [687.0],
  [Júpiter], [1898], [4331],
)
```

## Licença

O código do pacote está licenciado sob a licença [AGPL-3.0-or-later](https://spdx.org/licenses/AGPL-3.0-or-later.html).
O conteúdo gerado pelo pacote não é coberto por essa licença, mas sim pelas licenças dos autores dos textos.
A template em si é coberta pela licença [MIT](https://spdx.org/licenses/MIT.html).
