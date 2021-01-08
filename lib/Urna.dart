import 'Info.dart';
import 'Entrada.dart';
import 'InfoEntrada.dart';
import 'package:flutter/material.dart';

class _UrnaState extends State<Urna> {
  String _state =
      "Inicio"; // Inicio, SelecaoCandidato, InformaEscolha, CandidatoInvalido
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
    ],
    "selecionado": [
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
    if (_state == "Inicio") {
      if (result == "OK") {
        setState(() {
          _state = "SelecaoCandidato";
        });
      }
    } else if (_state == "SelecaoCandidato") {
      if (result == "X") {
        setState(() {
          _state = "Inicio";
        });
      } else if (result != "") {
        int index = this
            ._info["candidatos"]
            .indexWhere((element) => element["numero"] == result);

        if (index != -1) {
          setState(() {
            _state = "InformaEscolha";
            this._info["selecionado"][0] = this._info["candidatos"][index];
          });
        } else {
          setState(() {
            _state = "CandidatoInvalido";
          });
        }
      }
    } else if (_state == "InformaEscolha" || _state == "CandidatoInvalido") {
      setState(() {
        _state = "Inicio";
      });
    }

    for (Inform info in infos) {
      info.showInfo();
    }
    for (Inform info in infoEntrada) {
      info.showInfo();
    }
  }

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
        Widget entradaInfo =
            informEntradaMapping(hardware['nome'], _info, _state, submit);
        if (!(entradaInfo is NullInform)) {
          insertEntrada(entradaInfo);
        }
      }
    }
    return Container(
      width: 700,
      child: Row(
        children: [
          Row(children: [
            for (var info in infos) info,
            for (var entry in entrada) entry,
            for (var infoentry in infoEntrada) infoentry
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
