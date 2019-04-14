import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: "Contador de Pessoas", home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _capacidade = 10;
  int _counter = 0;
  String _info = "Pode entrar";

  void maisUm() {
    setState(() {
      if (_counter == _capacidade - 1) {
        ++_counter;
        _info = "Lotado";
        return;
      }

      if (_counter < _capacidade) {
        ++_counter;
        _info = "Pode entrar";
      }
    });
  }

  void menosUm() {
    setState(() {
      if (_counter > 0) {
        --_counter;
        _info = "Pode entrar";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/restaurant.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Pessoas: $_counter",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text(
                      "+",
                      style: TextStyle(color: Colors.white, fontSize: 50.0),
                    ),
                    onPressed: () {
                      maisUm();
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text(
                      "-",
                      style: TextStyle(color: Colors.white, fontSize: 50.0),
                    ),
                    onPressed: () {
                      menosUm();
                    },
                  ),
                )
              ],
            ),
            Text(
              _info,
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30.0),
            )
          ],
        )
      ],
    );
  }
}
