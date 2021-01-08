# Urna

## Aluno

Iago Elias de Faria Barbosa - 759027

## Como rodar:

Instale o flutter seguindo esse tutorial: [Tutorial](https://flutter.dev/docs/get-started/install)

Siga os procedimentos adicionais para habilitar o modo webdev [Tutorial Wev](https://flutter.dev/docs/get-started/web)

Execute:

```bash
flutter run -d chrome
```

Você pode selecionar a função desejada no menu lateral, funções disponíveis: (Tela de Cristal, Touch Screen, Saída Fone, Armazenamento Interno, Auto-Falante)

Aí é só utilizar normalmente!

## Discussão sobre os conceitos aprendidos na disciplina

Aqui discutirei como cada conceito foi garantido na minha implementação e também as eventuais dificuldades enfrentadas para executar o projeto.

### S — Single responsibility principle:

No projeto existem 4 principais funcionalidades, a classe ```Urna```, com a função de centralizar o ciclo de vida dos hardwares, a interface ```Entrada```, que assume a responsabilidade de ler as entradas e passar para a urna, as interface ```Inform``` com a responsibilidade de informar o usuário das suas escolhas e do ciclo de vida da urna e o ```Register``` que tem o intuito de salvar os dados finais da urna.

O princípio foi garantido não apenas dividindo essas classes, mas também fazendo uso do gerenciamento de estado do flutter, que divide o gerenciamento de estado do Widget propriamente dito.

### O — Open closed principle

Baseado na forma como a Urna lê as entradas, saídas e dispõe as vizualizações (como se elas fossem a mesma coisa), para expandir, basta escolher uma interface e implementar sua visualização e funcionamento do jeito que a interface exige, depois disso basta adicionar sua classe no mapeamento e está pronto (toda interface tem um mapping específico). Nenhum código adicional é necessário.

### L — Liskov substitution principle

Esse ficou faltando, pois as interfaces não são Widgets, diferente das suas implementações propriamente ditas. O que impossibilita o princípio da substituição do Liskov fazer sentido.

### I — Interface segregation principle

Todas as interfaces fazem sua função e sua implementação é restrita ao absolutamente necessário, uma visualização de onde isso acontece, é na classe ```ScreenWidget``` que é um instrumento de entrada e de saída simultaneamente (quando o touch é habilitado), ao invés de ter uma interface global que obrigaria todos os objetos abaixo a implementar ambas as funções (entrada e saída), o ```ScreenWidget``` é o único que assume a responsabilidade de implementar ambas as interfaces, tendo que sobrescrever funções de entrada e saída. O que acaba garantindo esse princípio.