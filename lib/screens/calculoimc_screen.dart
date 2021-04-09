import 'package:aula_imc/widgets/calculoimc_widget.dart';
import 'package:flutter/material.dart';

class CalculoImcScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Calculos IMC e IAC"),
      ),
      body: CalculoImcWidget(),
    );
  }
}
