import 'package:aula_imc/widgets/calculoiac_widget.dart';
import 'package:aula_imc/widgets/calculoimc_widget.dart';
import 'package:flutter/material.dart';

class CalculoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Calculos IMC e IAC"),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                  icon: Icon(Icons.control_point_duplicate_outlined),
                  text: 'IMC'),
              Tab(
                  icon: Icon(Icons.control_point_duplicate_outlined),
                  text: 'IAC'),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(
              child: (CalculoImcWidget()),
            ),
            Center(
              child: (CalculoIacWidget()),
            ),
          ],
        ),
      ),
    );
  }
}
