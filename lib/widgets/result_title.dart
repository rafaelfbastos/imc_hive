import 'package:flutter/material.dart';
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
        trailing: Text(ColorCard.imcStats(_entry.value)),
        tileColor: ColorCard.imcColor(_entry.value),
        title: Text("IMC: ${_entry.value.toStringAsFixed(2)}"),
        subtitle: Text("Data: ${_entry.key}"),
      ),
    );
  }
}
