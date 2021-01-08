import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

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

class AudioInform extends StatelessWidget implements Inform {
  final String state;
  final Map<String, List<Map<String, String>>> info;
  final FlutterTts flutterTts = FlutterTts();
  final double volume = 0.5;
  final double pitch = 1.0;
  final double rate = 0.5;

  AudioInform({Key key, @required this.state, @required this.info})
      : super(key: key);

  Future<bool> playAudio() async {
    await flutterTts.setVolume(volume);
    await flutterTts.setSpeechRate(rate);
    await flutterTts.setPitch(pitch);
    int result = 0;
    if (state == "InformaEscolha") {
      result = await flutterTts
          .speak('seu candidato é ${info["selecionado"][0]["nome"]}');
    } else {
      result = await flutterTts.speak('seu estado é $state');
    }
    return result == 1 ? true : false;
  }

  void showInfo() {
    playAudio().then((success) => {}).whenComplete(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.shrink();
  }
}

Inform informMapping(
    String inform, Map<String, List<Map<String, String>>> info, String state) {
  switch (inform) {
    case ('Saída Fone de Ouvido'):
      return AudioInform(state: state, info: info);
    case ('Auto-falante'):
      return AudioInform(state: state, info: info);
    default:
      return NullInform(info: info, state: state);
  }
  // 'Display Braille'::
}
