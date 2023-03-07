import 'package:flutter/material.dart';
import 'package:imc/controller/app_controller.dart';
import 'package:imc/models/user_model.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class UserTitle extends StatelessWidget {
  final UserModel _user;
  final bool edit;
  final int _index;

  const UserTitle(
      {Key? key,
      required UserModel user,
      this.edit = false,
      required int index})
      : _user = user,
        _index = index,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat.compactCurrency(
        locale: "pt_br", decimalDigits: 2, symbol: "");
    final altura = formatter.format(_user.altura);

    return Card(
      child: ListTile(
        onTap: () {
          var controller = context.read<AppController>();
          if (edit && controller.users.isNotEmpty) {
            controller.delete();
          } else {
            controller.saveLast(_index);
            controller.changePage(1);
          }
        },
        title: Text(_user.name),
        subtitle: Text("Altura: $altura"),
        trailing: edit ? const Icon(Icons.delete) : null,
        leading: const Icon(
          Icons.account_circle,
          size: 50,
        ),
      ),
    );
  }
}
