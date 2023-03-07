import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imc/ui/color_card.dart';

class ResultTitle extends StatelessWidget {
  final MapEntry<String, double> _entry;

  const ResultTitle({Key? key, required MapEntry<String, double> entry})
      : _entry = entry,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        dense: true,
        trailing: Text(ColorCard.imcStats(_entry.value),
            style: GoogleFonts.montserratAlternates(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: (_entry.value >= 35) ? Colors.white : null)),
        tileColor: ColorCard.imcColor(_entry.value),
        title: Text(
          "IMC: ${_entry.value.toStringAsFixed(2)}",
          style: GoogleFonts.montserratAlternates(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: (_entry.value >= 35) ? Colors.white : null,
          ),
        ),
        subtitle: Text(
          "Data: ${_entry.key}",
          style: GoogleFonts.montserratAlternates(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: (_entry.value >= 35) ? Colors.white : null),
        ),
      ),
    );
  }
}
