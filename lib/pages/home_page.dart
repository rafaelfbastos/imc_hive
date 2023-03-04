import 'package:flutter/material.dart';
import 'package:imc/services/app_controller.dart';

class HomePage extends StatefulWidget {
  final AppController _controller;

  const HomePage({Key? key, required AppController controller})
      : _controller = controller,
        super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(''),
        ),
        body: Column(
          children: [
            Container(
              child: Text("${widget._controller.todos()}"),
            ),
            ElevatedButton(
                onPressed: () {
                  widget._controller.limpar();
                },
                child: Text('Ok'))
          ],
        ));
  }
}
