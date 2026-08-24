# Mobile 08 — Exercício 3: Estatísticas do Time

Repositório criado para registrar a aula de **Desenvolvimento Mobile I** utilizando Flutter e Dart.

Nesta aula foi desenvolvido o **Exercício 3**, com foco em entrada de dados, cálculos de médias, gerenciamento de estado e atualização dinâmica da interface.

---

## Sobre o exercício

O aplicativo calcula estatísticas básicas de um time a partir dos seguintes dados:

* Número de jogos disputados
* Total de gols marcados
* Total de assistências

Com essas informações, a aplicação calcula:

* Média de gols por jogo
* Média de participações em gols por jogo

Também existe uma opção para limpar todos os campos e reiniciar os resultados.

---

## Tecnologias utilizadas

* Flutter
* Dart
* Material Design
* Git
* GitHub

---

## Conceitos praticados

* `StatefulWidget`
* `TextEditingController`
* `TextField`
* `TextInputType.number`
* `InputDecoration`
* `setState()`
* `int.tryParse()`
* Operações matemáticas
* Condicionais
* Cálculo de médias
* `toStringAsFixed()`
* `ElevatedButton.icon`
* `OutlinedButton.icon`
* `Row`
* `Column`
* `Padding`
* `SizedBox`
* `dispose()`

---

## Estrutura do repositório

```text
mobile08/
├── README.md
└── exercicio3/
    ├── android/
    ├── ios/
    ├── lib/
    │   └── main.dart
    ├── linux/
    ├── macos/
    ├── web/
    ├── windows/
    └── pubspec.yaml
```

---

## Funcionamento

O usuário informa os dados através de três campos:

```text
Jogos disputados
Gols marcados
Assistências
```

Os valores são controlados utilizando `TextEditingController`.

---

## Média de gols

A média de gols por jogo é calculada através de:

```dart
mediaGols = gols / jogos;
```

Exemplo:

```text
10 gols
÷
5 jogos
=
2 gols por jogo
```

---

## Média de participações

As participações consideram gols e assistências:

```dart
mediaParticipacoes = (gols + assistencias) / jogos;
```

Exemplo:

```text
10 gols
+
5 assistências
=
15 participações

15 ÷ 5 jogos = 3 participações por jogo
```

---

## Validação

Antes de realizar a divisão, a aplicação verifica:

```dart
if (jogos > 0)
```

Isso evita uma divisão por zero.

Caso nenhum jogo seja informado, os resultados permanecem em:

```text
0
```

---

## Atualização da interface

Os cálculos são realizados dentro de:

```dart
setState()
```

Exemplo:

```dart
setState(() {
  if (jogos > 0) {
    mediaGols = gols / jogos;
    mediaParticipacoes = (gols + assistencias) / jogos;
  }
});
```

O `setState()` atualiza os resultados exibidos na tela.

---

## Exibição dos resultados

As médias são exibidas com duas casas decimais utilizando:

```dart
toStringAsFixed(2)
```

Exemplo:

```text
Média de gols por jogo: 2.50
```

---

## Botões

### Calcular

Executa a função:

```dart
calcularEstatisticas()
```

### Limpar

Executa:

```dart
limparCampos()
```

Essa função limpa os três campos e redefine os resultados.

---

## Dispose

Os controllers também são liberados utilizando:

```dart
dispose()
```

Isso evita que recursos permaneçam ocupados desnecessariamente após o encerramento da tela.

---

## Fluxo da aplicação

```text
Usuário informa os dados
        ↓
TextField
        ↓
TextEditingController
        ↓
Botão Calcular
        ↓
calcularEstatisticas()
        ↓
Validação
        ↓
Cálculo das médias
        ↓
setState()
        ↓
Resultados atualizados
```

---

## Como executar

Clone o repositório:

```bash
git clone https://github.com/Luanlhp777/mobile08.git
```

Entre na pasta do exercício:

```bash
cd mobile08/exercicio3
```

Instale as dependências:

```bash
flutter pub get
```

Execute:

```bash
flutter run
```

---

## Objetivos da aula

* Reforçar o uso de `StatefulWidget`
* Trabalhar com entrada numérica
* Utilizar `TextEditingController`
* Converter textos para números
* Realizar cálculos de média
* Utilizar condicionais
* Evitar divisão por zero
* Atualizar a interface com `setState()`
* Formatar números decimais
* Limpar campos
* Utilizar corretamente `dispose()`

---

## Autor

**Luan Araujo**

Estudante de Desenvolvimento de Sistemas

GitHub: `Luanlhp777`

---

Projeto acadêmico desenvolvido para prática de **Flutter, Dart, cálculos, gerenciamento de estado e entrada de dados**.
