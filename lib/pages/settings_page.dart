import 'package:flutter/material.dart';
import 'package:imc/controller/app_controller.dart';
import 'package:imc/models/user_model.dart';
import 'package:imc/widgets/new_user.dart';
import 'package:imc/widgets/user_title.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  final AppController _controller;

  const SettingsPage({Key? key, required AppController controller})
      : _controller = controller,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final nameEC = TextEditingController();
    final heightEC = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Usuários"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Usuário Selecionado:"),
            const SizedBox(
              height: 5,
            ),
            UserTitle(
              user: context.watch<AppController>().lastUser ?? UserModel.def(),
              edit: true,
              index: 0,
            ),
            const SizedBox(
              height: 5,
            ),
            const Text("Usuários Cadastrados"),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _controller.users.length,
                itemBuilder: (context, index) {
                  return UserTitle(
                      user: _controller.users[index], index: index);
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showDialog(
            context: context,
            builder: (context) => NewUser(
                  nameEC: nameEC,
                  heightEC: heightEC,
                  formKey: formKey,
                  controller: context.read<AppController>(),
                )),
        label: const Text("Novo usuário"),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
