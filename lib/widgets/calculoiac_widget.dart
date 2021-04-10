import 'dart:math';

import 'package:flutter/material.dart';

class CalculoIacWidget extends StatefulWidget {
  @override
  _CalculoIacWidget createState() => _CalculoIacWidget();
}

class _CalculoIacWidget extends State<CalculoIacWidget> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController alturacontroller = TextEditingController();
  TextEditingController pesocontroller = TextEditingController();
  TextEditingController quadrilcontroller = TextEditingController();

  int _value = 0; //para check
  String _resultadoiac;

  void _calculariac() {
    double altura = double.parse(alturacontroller.text) / 100.0;
    double quadril = double.parse(quadrilcontroller.text);
    double iac = (quadril / (altura * sqrt(altura))) - 18;

    setState(() {
      _resultadoiac = iac.toStringAsFixed(2) +
          " ________ " +
          getClassificacaoIAC(iac) +
          "\n";
    });
  }

  String getClassificacaoIAC(num iac) {
    String strclassificaoIAC;
    switch (_value) {
      case 0: //masculino
        if (iac < 20)
          strclassificaoIAC = "Normal";
        else if (iac < 25)
          strclassificaoIAC = "Sobrepeso";
        else
          strclassificaoIAC = "Obesidade";
        break;

      case 1: //feminino
        if (iac < 32)
          strclassificaoIAC = "Normal";
        else if (iac < 38)
          strclassificaoIAC = "Sobrepeso";
        else
          strclassificaoIAC = "Obesidade";
        break;
    }
    return strclassificaoIAC;
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
                  return value.isEmpty ? "Informe a altura em cm" : null;
                },
                decoration: InputDecoration(
                  labelText: "Altura em cm: ",
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.all(16),
              child: TextFormField(
                //peso
                keyboardType: TextInputType.number,
                controller: pesocontroller,
                validator: (value) {
                  //validador
                  return value.isEmpty ? "Informe o peso em Kg" : null;
                },
                decoration: InputDecoration(
                  labelText: "Peso em Kg: ",
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.all(16),
              child: TextFormField(
                //quadril
                keyboardType: TextInputType.number,
                controller: quadrilcontroller,
                validator: (value) {
                  //validador
                  return value.isEmpty ? "Informe medida em centímetros" : null;
                },
                decoration: InputDecoration(
                  labelText: "Circunferência do quadril em cm:",
                ),
              ),
            ),

            //botões de genero
            Container(
              margin: EdgeInsets.all(16),
              //genero
              child: Wrap(
                children: [
                  //icones de escolha check
                  ChoiceChip(
                    label: Text("Masculino"),
                    selected: _value == 0,
                    onSelected: (value) {
                      setState(() {
                        _value = value ? 0 : -1;
                      });
                    },
                  ),
                  const SizedBox(width: 20),
                  ChoiceChip(
                    label: Text("Feminino"),
                    selected: _value == 1,
                    onSelected: (value) {
                      setState(() {
                        _value = value ? 1 : -1;
                      });
                    },
                  ),
                ],
              ),
            ),

            // resultados Text
            Container(
              margin: EdgeInsets.all(16),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _resultadoiac == null ? "" : "IAC: $_resultadoiac",
                    )
                  ]),
            ),

            //botão calcular
            Container(
              margin: EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState.validate()) {
                    _calculariac();
                  }
                },
                child: Text("OBTER RESULTADOS"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
