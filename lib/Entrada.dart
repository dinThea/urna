import 'package:flutter/material.dart';

abstract class Entrada {
  sendInfo(String data);
}

class NullEntrada extends StatelessWidget implements Entrada {
  final String buffer = "";
  sendInfo(String data) {
    print(buffer);
  }

  clearBuffer() {
    print(buffer);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.shrink();
  }
}

class _KeyboardWidgetState extends State<KeyboardWidget> implements Entrada {
  String buffer = "";

  sendInfo(data) {
    print(data);
    widget.callback(data);
  }

  clearBuffer() {
    buffer = "";
  }

  processLetter(String letter) {
    if (letter != "OK" && letter != "X") {
      buffer += letter;
    } else if (letter == "OK") {
      sendInfo(buffer == "" ? "OK" : this.buffer);
      clearBuffer();
    } else if (letter == "X") {
      sendInfo("X");
      clearBuffer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      for (var row in widget.keyboard)
        Row(
          children: [
            for (var number in row)
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () => {processLetter(number)},
                    child: Container(
                        color: Colors.grey[600],
                        width: 290 / 4 - 16,
                        height: 290 / 4 - 16,
                        child: Center(child: Text(number))),
                  ))
          ],
        )
    ]);
  }
}

class KeyboardWidget extends StatefulWidget {
  final List<List<String>> keyboard = [
    ["1", "2", "3", "4"],
    ["4", "5", "6", "7"],
    ["8", "9", "OK", "X"]
  ];
  final void Function(String) callback;

  @override
  KeyboardWidget({Key key, this.callback}) : super(key: key);
  @override
  _KeyboardWidgetState createState() => _KeyboardWidgetState();
}

Widget entradaMapping(String entry, void Function(String) callback) {
  switch (entry) {
    case ('Teclado Físico'):
      return KeyboardWidget(callback: callback);
    default:
      return NullEntrada();
  }
  // 'Display Braille':
  // 'Saída Fone de Ouvido':
  // 'Auto-falante', 'active':
}
