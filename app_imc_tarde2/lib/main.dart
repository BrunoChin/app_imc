import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController pesoControle = TextEditingController();
  TextEditingController alturaControle = TextEditingController();

  String _info = "Digite Peso e altura";

  void _resetarCampos(){
    pesoControle.text="";
    alturaControle.text="";
    setState(() {
      _info = "Digite o peso e altura";
    });
  }

  void _calcularImc(){
    double peso = double.parse(pesoControle.text);
    double altura = double.parse(alturaControle.text);
    double imc = peso/(altura * altura);

    setState(() {
      if(imc < 17){
        _info = "Muito abaixo do peso";
      }
      else if(imc < 18.49){
        _info = "Abaixo do peso";
      }
      else if(imc < 24.99){
        _info = "Peso normal";
      }
      else if(imc < 29.99){
        _info = "Acima do peso";
      }
      else if(imc < 34.99){
        _info = "Obesidade I";
      }
      else if(imc < 39.99){
        _info = "Obesidade II";
      }
      else{
        _info = "Obesidade III";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calculadora IMC"),
          centerTitle: true,
          backgroundColor: Colors.green,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: _resetarCampos,
            )
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 15.0, right: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(
                Icons.person_outline,
                size: 120.0,
                color: Colors.green,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Peso (kg)",
                    labelStyle: TextStyle(color: Colors.green)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25.0),
                controller: pesoControle,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Altura (cm)",
                    labelStyle: TextStyle(color: Colors.green)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25.0),
                controller: alturaControle,
              ),
              Container(
                height: 70.0,
                padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                child: RaisedButton(

                  child: Text(
                    "Calcular",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.green,
                  onPressed: _calcularImc,
                ),
              ),
              Text(
                _info,
                style: TextStyle(color: Colors.green, fontSize: 25.0),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ));
  }
}













