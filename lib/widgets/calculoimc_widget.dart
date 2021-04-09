import 'dart:math';

import 'package:flutter/material.dart';

class CalculoImcWidget extends StatefulWidget {
  @override
  _CalculoImcWidget createState() => _CalculoImcWidget();
}

class _CalculoImcWidget extends State<CalculoImcWidget> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController alturacontroller = TextEditingController();
  TextEditingController pesocontroller = TextEditingController();

  String _resultadoimc;

  void _calcularimc() {
    double altura = double.parse(alturacontroller.text) / 100.0;
    double peso = double.parse(pesocontroller.text);
    double imc = peso / pow(altura, 2);

    setState(() {
      _resultadoimc = imc.toStringAsFixed(2) + "\n\n" + getClassificacao(imc);
    });
  }

  String getClassificacao(num imc) {
    String strclassificao;
    if (imc < 18.6)
      strclassificao = "Abaixo do peso";
    else if (imc < 25.0)
      strclassificao = "Peso ideal";
    else if (imc < 30.0)
      strclassificao = "Levemente acima do peso";
    else if (imc < 35.0)
      strclassificao = "Obesidade grau 1";
    else if (imc < 40.0)
      strclassificao = "Obesidade grau 2";
    else
      strclassificao = "Obesidade grau 3";
    return strclassificao;
  }

  @override
  Widget build(BuildContext context) {
    //retornou um form Pai de todos.
    return Form(
      key: _formkey,
      child: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(16),
              //altura
              //mudamos de textfield para TextFormField
              child: TextFormField(
                keyboardType: TextInputType.number, //tipo de teclado
                controller: alturacontroller,
                validator: (value) {
                  //validador
                  return value.isEmpty ? "Informe a altura" : null;
                },
                decoration: InputDecoration(
                  labelText: "Altura em cm: ",
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(16),
              //peso
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: pesocontroller,
                validator: (value) {
                  //validador
                  return value.isEmpty ? "Informe a altura" : null;
                },
                decoration: InputDecoration(
                  labelText: "Peso em Kg: ",
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(16),
              child: Text(
                _resultadoimc == null ? "" : "IMC: $_resultadoimc",
              ),
            ),
            Container(
              margin: EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState.validate()) {
                    _calcularimc();
                  }
                },
                child: Text("Calcular"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
