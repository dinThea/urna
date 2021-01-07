import 'package:flutter/material.dart';
import 'Entrada.dart';
import 'Info.dart';

class CandidatoCard extends StatelessWidget {
  final Map<String, String> candidato;
  const CandidatoCard({Key key, @required this.candidato}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        child: Row(
          children: [
            new Container(
                padding: const EdgeInsets.all(8.0),
                child:
                    Image(height: 100, image: AssetImage(candidato["foto"]))),
            new Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(candidato["nome"],
                      style: Theme.of(context).textTheme.title),
                  Text(candidato["numero"],
                      style: TextStyle(color: Colors.black.withOpacity(0.5))),
                  Text(candidato["texto"]),
                ],
              ),
            )
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ));
  }
}

class ScreenWidget extends StatelessWidget implements Inform, Entrada {
  final String state;
  final Map<String, List<Map<String, String>>> info;

  ScreenWidget(
      {Key key,
      @required this.state,
      @required this.info,
      @required this.callback})
      : super(key: key);

  sendInfo(String data) {
    this.callback(data);
  }

  final void Function(String) callback;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
            padding: EdgeInsets.all(8.0),
            // Add a key to the ListView. This makes it possible to
            // find the list and scroll through it in the tests.
            key: Key('long_list'),
            children: List.generate(info["candidatos"].length, (index) {
              return Center(
                  child: CandidatoCard(candidato: info["candidatos"][index]));
            })),
        width: 400,
        height: 400,
        color: Colors.grey[700]);
  }

  void showInfo() {
    print('na tela -> ${this.info}');
  }

  Map<String, List<Map<String, String>>> getInfo() {
    return this.info;
  }
}

dynamic informEntradaMapping(
    String inform,
    Map<String, List<Map<String, String>>> info,
    String state,
    void Function(String) callback) {
  switch (inform) {
    case ('Tela de Cristal'):
      return ScreenWidget(info: info, state: state, callback: callback);
    default:
      return NullInform(info: info, state: state);
  }
  // 'Display Braille':
  // 'Saída Fone de Ouvido':
  // 'Auto-falante', 'active':
}
