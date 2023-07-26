import 'package:flutter/material.dart';

class TelaHist extends StatelessWidget {
  List historico = [];

  TelaHist(this.historico, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Histórico", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.orange,
        ),
        // Pra mostrar a lista do historico
        body: ListView.builder(
            itemCount: historico.length,
            itemBuilder: (BuildContext context, int index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: 50,
                    color: Colors.orange,
                    child: Center(
                      child: Text("${historico[index]}"),
                    )))));
  }
}
