import 'Info.dart';
import 'Entrada.dart';
import 'InfoEntrada.dart';
import 'package:flutter/material.dart';

class _UrnaState extends State<Urna> {
  String _state = "Inicio"; // Inicio, SelecaoCandidato, InformaEscolha
  Map<String, List<Map<String, String>>> _info = {
    "candidatos": [
      {
        "texto": "Candidato do PT",
        "nome": "Luis Inácio Lula da Silva",
        "foto": "lulalindo.png",
        "numero": "13"
      },
      {
        "texto": "Candidato do PT",
        "nome": "Luis Inácio Lula da Silva",
        "foto": "lulalindo.png",
        "numero": "13"
      },
      {
        "texto": "Candidato do PT",
        "nome": "Luis Inácio Lula da Silva",
        "foto": "lulalindo.png",
        "numero": "13"
      },
      {
        "texto": "Candidato do PT",
        "nome": "Luis Inácio Lula da Silva",
        "foto": "lulalindo.png",
        "numero": "13"
      },
      {
        "texto": "Candidato do PT",
        "nome": "Luis Inácio Lula da Silva",
        "foto": "lulalindo.png",
        "numero": "13"
      },
      {
        "texto": "Candidato do PT",
        "nome": "Luis Inácio Lula da Silva",
        "foto": "lulalindo.png",
        "numero": "13"
      },
      {
        "texto": "Candidato do PT",
        "nome": "Luis Inácio Lula da Silva",
        "foto": "lulalindo.png",
        "numero": "13"
      }
    ]
  };

  List<dynamic> infos = List<dynamic>.empty(growable: true);
  List<Widget> entrada = List<Widget>.empty(growable: true);
  List<dynamic> infoEntrada = List<dynamic>.empty(growable: true);

  void insertInform(Inform info) {
    this.infos.add(info);
  }

  void insertEntrada(Widget entry) {
    this.entrada.add(entry);
  }

  void showData(String data) {
    for (Inform info in this.infos) {
      info.showInfo();
    }
  }

  void submit(String result) {
    if (_state == "Inicio") {}
  }

  Widget correctWidgetOrEmpty(String data) {}

  @override
  Widget build(BuildContext context) {
    this.infos.clear();
    this.entrada.clear();
    for (var hardware in widget.hardware) {
      if (hardware['active']) {
        Inform info = informMapping(hardware['nome'], _info, _state);
        if (!(info is NullInform)) {
          insertInform(info);
        }
        Widget entrada = entradaMapping(hardware['nome'], submit);
        if (!(entrada is NullEntrada)) {
          insertEntrada(entrada);
        }
      }
    }
    return Container(
      width: 700,
      child: Row(
        children: [
          Row(children: [
            for (var info in infos) info,
            for (var entry in entrada) entry
          ]),
          Container()
        ],
      ),
      color: Colors.grey[350],
    );
  }
}

class Urna extends StatefulWidget {
  final List<Map<String, dynamic>> hardware;
  const Urna({Key key, this.hardware}) : super(key: key);

  @override
  _UrnaState createState() => _UrnaState();
}
