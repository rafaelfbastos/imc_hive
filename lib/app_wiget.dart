import 'package:flutter/material.dart';
import 'package:imc/pages/home_page.dart';
import 'package:imc/controller/app_controller.dart';
import 'package:provider/provider.dart';

class AppWiget extends StatelessWidget {
  const AppWiget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppController controller = context.read();
    return MaterialApp(
      title: "Imc",
      home: HomePage(controller: controller),
    );
  }
}
