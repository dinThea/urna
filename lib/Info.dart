import 'package:flutter/material.dart';

abstract class Inform {
  showInfo();
}

class NullInform extends StatelessWidget implements Inform {
  final String state;
  final Map<String, List<Map<String, String>>> info;

  NullInform({Key key, @required this.state, @required this.info})
      : super(key: key);

  void showInfo() {
    print('em braile -> ${this.info}');
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.shrink();
  }
}

class BrailleInform implements Inform {
  String info = "";
  void showInfo() {
    print('em braile -> ${this.info}');
  }
}

class AudioInform implements Inform {
  String info = "";
  void showInfo() {
    print('em audio -> ${this.info}');
  }
}

Inform informMapping(
    String inform, Map<String, List<Map<String, String>>> info, String state) {
  switch (inform) {
    default:
      return NullInform(info: info, state: state);
  }
  // 'Display Braille':
  // 'Saída Fone de Ouvido':
  // 'Auto-falante', 'active':
}
