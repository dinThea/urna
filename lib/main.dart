import 'package:flutter/material.dart';
import 'Urna.dart';

void main() {
  runApp(MyApp());
}

class OptionsList extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  final dynamic Function(String) callback;

  OptionsList({Key key, @required this.callback, @required this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      DrawerHeader(
        child: Text('Itens possíveis'),
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
      ),
      for (var item in this.items)
        ListTile(
            title: Text(item['nome']),
            tileColor: item['active'] ? Colors.blueGrey[500] : Colors.grey[300],
            onTap: () => this.callback(item['nome']))
    ]);
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'Urna Eletrônica'));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, dynamic>> items = [
    {'nome': 'Tela de Cristal', 'active': true},
    {'nome': 'Display Braille', 'active': false},
    {'nome': 'Saída Fone de Ouvido', 'active': false},
    {'nome': 'Teclado Físico', 'active': true},
    {'nome': 'Touch Screen', 'active': false},
    {'nome': 'Armazenamento Interno', 'active': false},
    {'nome': 'Impressora Térmica', 'active': false},
    {'nome': 'Internet', 'active': false},
    {'nome': 'Armazenamento Externo', 'active': false},
    {'nome': 'Comunicação com o mesário', 'active': false},
    {'nome': 'Auto-falante', 'active': false},
  ];

  changeItem(String item) {
    int index = items.indexWhere((element) => element['nome'] == item);
    this.setState(() {
      items[index]['active'] = !items[index]['active'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        drawer:
            Drawer(child: OptionsList(items: this.items, callback: changeItem)),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Urna(hardware: items)],
          ),
        ));
  }
}
