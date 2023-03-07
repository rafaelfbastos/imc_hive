import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Deseja excluir usuário?",
                        style: GoogleFonts.montserratAlternates(
                            fontWeight: FontWeight.bold)),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          controller.delete();
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                        child: const Text("Sim"),
                      ),
                      ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text("Não"),
                      ),
                    ],
                  );
                });
          } else {
            controller.saveLast(_index);
            controller.changePage(1);
          }
        },
        title: Text(
          _user.name,
          style: GoogleFonts.montserratAlternates(
              fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          "Altura: $altura",
          style: GoogleFonts.montserratAlternates(
            fontWeight: FontWeight.w800,
            fontSize: 15,
          ),
        ),
        trailing: edit
            ? const Icon(
                Icons.delete,
                color: Colors.red,
              )
            : null,
        leading: const Icon(
          Icons.account_circle,
          size: 50,
        ),
      ),
    );
  }
}
