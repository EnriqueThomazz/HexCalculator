import 'package:flutter/material.dart';

import 'calculator.dart';
import 'telaHist.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _equacao = TextEditingController();
  String _result = "";

  List historico = [];

  Color btnClr = Colors.deepOrange;

  void _addCaracter(String c) {
    setState(() {
      _equacao.text += c;
    });
  }

  void _clear() {
    setState(() {
      _equacao.text = "";
      _result = "";
    });
  }

  void _calculate() {
    String res = calculate(_equacao.text);
    historico.insert(0, "${_equacao.text} = $res");

    setState(() {
      _result = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => TelaHist(historico))));
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.orangeAccent),
          child: const Text(
            "hist",
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
        title: const Text(
          "Calculadora Hexadecimal",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.orange,
      ),
      // Coluna Principal
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              // Campos de Saída de texto
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: TextFormField(
                          textAlign: TextAlign.end,
                          decoration: InputDecoration(border: InputBorder.none),
                          controller: _equacao))
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Text(_result,
                    style: const TextStyle(fontSize: 30, color: Colors.black87))
              ]),
            ],
          ),

          // Botões principais
          Column(
            children: [
              // Todos os botões exceto . 0 =
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      ElevatedButton(
                          onPressed: () => _addCaracter("D"),
                          style:
                              ElevatedButton.styleFrom(backgroundColor: btnClr),
                          child: const Text("D")),
                      ElevatedButton(
                          onPressed: () => _addCaracter("A"),
                          style:
                              ElevatedButton.styleFrom(backgroundColor: btnClr),
                          child: const Text("A")),
                      ElevatedButton(
                          onPressed: () => _addCaracter("7"),
                          style:
                              ElevatedButton.styleFrom(backgroundColor: btnClr),
                          child: const Text("7")),
                      ElevatedButton(
                          onPressed: () => _addCaracter("4"),
                          style:
                              ElevatedButton.styleFrom(backgroundColor: btnClr),
                          child: const Text("4")),
                      ElevatedButton(
                          onPressed: () => _addCaracter("1"),
                          style:
                              ElevatedButton.styleFrom(backgroundColor: btnClr),
                          child: const Text("1")),
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                          onPressed: () => _addCaracter("E"),
                          style:
                              ElevatedButton.styleFrom(backgroundColor: btnClr),
                          child: const Text("E")),
                      ElevatedButton(
                          onPressed: () => _addCaracter("B"),
                          style:
                              ElevatedButton.styleFrom(backgroundColor: btnClr),
                          child: const Text("B")),
                      ElevatedButton(
                          onPressed: () => _addCaracter("8"),
                          style:
                              ElevatedButton.styleFrom(backgroundColor: btnClr),
                          child: const Text("8")),
                      ElevatedButton(
                          onPressed: () => _addCaracter("5"),
                          style:
                              ElevatedButton.styleFrom(backgroundColor: btnClr),
                          child: const Text("5")),
                      ElevatedButton(
                          onPressed: () => _addCaracter("2"),
                          style:
                              ElevatedButton.styleFrom(backgroundColor: btnClr),
                          child: const Text("2")),
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                          onPressed: () => _addCaracter("F"),
                          style:
                              ElevatedButton.styleFrom(backgroundColor: btnClr),
                          child: const Text("F")),
                      ElevatedButton(
                          onPressed: () => _addCaracter("C"),
                          style:
                              ElevatedButton.styleFrom(backgroundColor: btnClr),
                          child: const Text("C")),
                      ElevatedButton(
                          onPressed: () => _addCaracter("9"),
                          style:
                              ElevatedButton.styleFrom(backgroundColor: btnClr),
                          child: const Text("9")),
                      ElevatedButton(
                          onPressed: () => _addCaracter("6"),
                          style:
                              ElevatedButton.styleFrom(backgroundColor: btnClr),
                          child: const Text("6")),
                      ElevatedButton(
                          onPressed: () => _addCaracter("3"),
                          style:
                              ElevatedButton.styleFrom(backgroundColor: btnClr),
                          child: const Text("3")),
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                          onPressed: _clear,
                          style:
                              ElevatedButton.styleFrom(backgroundColor: btnClr),
                          child: const Text("CE")),
                      ElevatedButton(
                          onPressed: () => _addCaracter(" + "),
                          style:
                              ElevatedButton.styleFrom(backgroundColor: btnClr),
                          child: const Text("+")),
                      ElevatedButton(
                          onPressed: () => _addCaracter(" - "),
                          style:
                              ElevatedButton.styleFrom(backgroundColor: btnClr),
                          child: const Text("-")),
                      ElevatedButton(
                          onPressed: () => _addCaracter(" x "),
                          style:
                              ElevatedButton.styleFrom(backgroundColor: btnClr),
                          child: const Text("x")),
                      ElevatedButton(
                          onPressed: () => _addCaracter(" / "),
                          style:
                              ElevatedButton.styleFrom(backgroundColor: btnClr),
                          child: const Text("/")),
                    ],
                  )
                ],
              ),

              // Botões . 0 =
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () => _addCaracter("."),
                      style: ElevatedButton.styleFrom(backgroundColor: btnClr),
                      child: const Text(".")),
                  ElevatedButton(
                      onPressed: () => _addCaracter("0"),
                      style: ElevatedButton.styleFrom(backgroundColor: btnClr),
                      child: const Text("0")),
                  Column(
                    children: [
                      SizedBox(
                          width: 160,
                          child: ElevatedButton(
                              onPressed: _calculate,
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: btnClr),
                              child: const Text("=")))
                    ],
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
