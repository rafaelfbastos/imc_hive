import 'package:flutter/material.dart';
import 'package:imc/controller/app_controller.dart';
import 'package:imc/widgets/result_title.dart';
import 'package:provider/provider.dart';

class ResultsPage extends StatelessWidget {
  final AppController _controller;
  const ResultsPage({Key? key, required AppController controller})
      : _controller = controller,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resultados"),
      ),
      body: Column(
          children: context.select<AppController, List<ResultTitle>>(
              (controller) =>
                  controller.lastUser?.imcs.entries
                      .map((e) => ResultTitle(entry: e))
                      .toList() ??
                  [])),
    );
  }
}
