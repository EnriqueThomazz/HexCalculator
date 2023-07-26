import 'dart:math';

String fracionaria(double x) {
  List saida = [];
  double resto = x;
  for (int i = 0; i < 4; i++) {
    double y = x * 16;
    saida.add(y.toInt().toRadixString(16));

    List num = y.toString().split(".");
    num[0] = "0.";
    resto = double.parse(num.join(""));
  }
  saida.insert(0, ".");
  return saida.join("");
}

//De um numero decimal fracionario para um numero hex fracionario
String convertDecHexFrac(double x) {
  int p_inteira = x.toInt();

  List frac = x.toString().split(".");
  frac[0] = "0.";
  double p_fracionaria = double.parse(frac.join(""));

  String hex = p_inteira.toRadixString(16) + fracionaria(p_fracionaria);

  // Formatação pra um numero inteiro n sair com casas decimais
  hex = hex.toUpperCase();
  List h = hex.split(".");
  if (h[1] == "0000") {
    return h[0];
  }

  return hex;
}

//De um numero hex fracionario para um numero decimal fracionario
double convertHexDecFrac(String hex) {
  List num = hex.split(".");

  int inteira_r = int.parse(num[0], radix: 16);

  if (num.length == 1) {
    return inteira_r + 0.0;
  }

  List frac = num[1].split("");
  List saida = [];
  double frac_r = 0;
  // Passando de hex pra inteiro a parte fracionaria
  for (int i = 0; i < frac.length; i++) {
    saida.add(int.parse(frac[i], radix: 16));
  }

  for (int i = 0; i < saida.length; i++) {
    frac_r = frac_r + pow(16, -i - 1) * saida[i];
  }

  return inteira_r + frac_r;
}
