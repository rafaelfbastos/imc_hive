import 'package:flutter/material.dart';
import 'package:imc/app_wiget.dart';
import 'package:imc/services/app_controller.dart';
import 'package:provider/provider.dart';

class AppModule extends StatelessWidget {
  const AppModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (__) => AppController(),
          lazy: false,
        )
      ],
      child: const AppWiget(),
    );
  }
}
