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
  TextEditingController generocontroller = TextEditingController();

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
    switch (generocontroller.text) {
      case "M":
        if (imc < 20.7)
          strclassificao = "Abaixo do peso";
        else if (imc < 26.4)
          strclassificao = "Peso ideal";
        else if (imc < 27.8)
          strclassificao = "Pouco acima do peso";
        else if (imc < 31.1)
          strclassificao = "Acima do peso";
        else
          strclassificao = "Obesidade";
        //return strclassificao;
        break;

      case "F":
        if (imc < 19.1)
          strclassificao = "Abaixo do peso";
        else if (imc < 25.8)
          strclassificao = "Peso ideal";
        else if (imc < 27.3)
          strclassificao = "Pouco acima do peso";
        else if (imc < 32.3)
          strclassificao = "Acima do peso";
        else
          strclassificao = "Obesidade";
        return strclassificao;
        break;
    }
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
              //genero
              child: TextFormField(
                keyboardType: TextInputType.text,
                controller: generocontroller,
                validator: (value) {
                  //validador
                  return value.isEmpty ? "M / F" : null;
                },
                decoration: InputDecoration(
                  labelText: "Digite M ou F",
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
