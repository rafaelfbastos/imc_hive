import 'package:flutter/material.dart';
import 'package:imc/controller/app_controller.dart';
import 'package:imc/pages/calc_page.dart';
import 'package:imc/pages/results_page.dart';
import 'package:imc/pages/settings_page.dart';
import 'package:provider/provider.dart';

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
  void initState() {
    widget._controller.addListener(() {
      if (widget._controller.users.isEmpty &&
          widget._controller.selectedPage != 0) {
        widget._controller.changePage(0);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Cadastre ao menos um usuário."),
          backgroundColor: Colors.red,
        ));
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget._controller.loadUsers();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: PageView(
            onPageChanged: (value) => widget._controller.changePage(value),
            controller: context.watch<AppController>().pageController,
            children: [
              SettingsPage(controller: widget._controller),
              CalcPage(controller: widget._controller),
              ResultsPage(
                controller: widget._controller,
              )
            ],
          ),
        ),
        BottomNavigationBar(
          onTap: (value) => context.read<AppController>().changePage(value),
          currentIndex: context.watch<AppController>().selectedPage,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: "Usuários"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.view_headline), label: "Resultados"),
          ],
        ),
      ],
    ));
  }
}
