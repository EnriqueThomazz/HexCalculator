import 'conversor.dart';

int _findOperator(List lista, int start, int k) {
  if (k == 1) {
    for (int i = start; i < lista.length; i++) {
      if (lista[i].toString() != "") {
        return i;
      }
    }
  } else {
    if (k == -1) {
      for (int i = start; i >= 0; i--) {
        if (lista[i].toString() != "") {
          return i;
        }
      }
    }
  }
  return -1; //Deveria retornar NULL, mas n deixa
}

String calculate(String equacao) {
  List eq = equacao.split(" ");
  List saida = [];

  // Convertendo numeros para decimal
  for (int i = 0; i < eq.length; i++) {
    if (eq[i] != "+" && eq[i] != "-" && eq[i] != "x" && eq[i] != "/") {
      saida.add(convertHexDecFrac(eq[i]));
    } else {
      saida.add(eq[i]);
    }
  }

  // Resolvendo x e /
  for (int i = 0; i < saida.length; i++) {
    if (saida[i] == "x") {
      saida[i] = saida[_findOperator(saida, i - 1, -1)] *
          saida[_findOperator(saida, i + 1, 1)];
      saida[_findOperator(saida, i - 1, -1)] = "";
      saida[_findOperator(saida, i + 1, 1)] = "";
    } else {
      if (saida[i] == "/") {
        saida[i] = saida[_findOperator(saida, i - 1, -1)] /
            saida[_findOperator(saida, i + 1, 1)];
        saida[_findOperator(saida, i - 1, -1)] = "";
        saida[_findOperator(saida, i + 1, 1)] = "";
      }
    }
  }

  // Resolvendo + e -
  for (int i = 0; i < saida.length; i++) {
    if (saida[i] == "+") {
      saida[i] = saida[_findOperator(saida, i - 1, -1)] +
          saida[_findOperator(saida, i + 1, 1)];
      saida[_findOperator(saida, i - 1, -1)] = "";
      saida[_findOperator(saida, i + 1, 1)] = "";
    } else {
      if (saida[i] == "-") {
        saida[i] = saida[_findOperator(saida, i - 1, -1)] -
            saida[_findOperator(saida, i + 1, 1)];
        saida[_findOperator(saida, i - 1, -1)] = "";
        saida[_findOperator(saida, i + 1, 1)] = "";
      }
    }
  }

  String resp = convertDecHexFrac(saida[_findOperator(saida, 0, 1)]);

  return resp;
}
