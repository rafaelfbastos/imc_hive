import 'package:flutter/material.dart';
import 'package:imc/app_wiget.dart';
import 'package:imc/repositories/user_repository.dart';
import 'package:imc/controller/app_controller.dart';
import 'package:imc/services/user_service.dart';
import 'package:provider/provider.dart';

class AppModule extends StatelessWidget {
  const AppModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<UserRepository>(
          create: (__) => UserRepository(),
        ),
        Provider<UserService>(
          create: (context) => UserService(repository: context.read()),
        ),
        ChangeNotifierProvider<AppController>(
          create: (context) => AppController(service: context.read()),
          lazy: false,
        )
      ],
      child: const AppWiget(),
    );
  }
}
