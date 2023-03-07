import 'package:flutter/material.dart';

class ColorCard {
  ColorCard._();

  static Color imcColor(double imc) {
    if (imc < 18.5) {
      return const Color(0XFFAECF36);
    } else if (imc > 18.5 && imc < 25) {
      return const Color(0XFFAECF36);
    } else if (imc > 25 && imc < 30) {
      return const Color(0XFFF89A1E);
    } else if (imc > 30 && imc < 35) {
      return const Color(0XFFF36D23);
    } else if (imc > 35 && imc < 40) {
      return const Color(0XFFC5161D);
    } else {
      return const Color(0XFF504F50);
    }
  }

  static String imcStats(double imc) {
    if (imc < 18.5) {
      return "Magreza";
    } else if (imc > 18.5 && imc < 25) {
      return "Normal";
    } else if (imc > 25 && imc < 30) {
      return "Sobrepeso";
    } else if (imc > 30 && imc < 35) {
      return "Obesidade grau I";
    } else if (imc > 35 && imc < 40) {
      return "Obesidade grau II";
    } else {
      return "Obesidade grau III";
    }
  }
}
