import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:imc/controller/app_controller.dart';
import 'package:imc/models/user_model.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

class NewUser extends StatelessWidget {
  final TextEditingController _nameEC;
  final TextEditingController _heightEC;
  final GlobalKey<FormState> _formKey;
  final AppController _controller;

  const NewUser(
      {Key? key,
      required TextEditingController nameEC,
      required TextEditingController heightEC,
      required GlobalKey<FormState> formKey,
      required AppController controller})
      : _nameEC = nameEC,
        _heightEC = heightEC,
        _formKey = formKey,
        _controller = controller,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatter =
        NumberFormat.simpleCurrency(locale: "pt_br", decimalDigits: 2);
    return AlertDialog(
      title: Text("Cadastrar Usuário:"),
      content: Form(
        key: _formKey,
        child: Wrap(children: [
          TextFormField(
            controller: _nameEC,
            validator: Validatorless.required("Digite seu nome:"),
            decoration: InputDecoration(label: Text("Nome:")),
          ),
          TextFormField(
            controller: _heightEC,
            validator: Validatorless.multiple([
              Validatorless.required("Digite sua altura"),
              (value) {
                var height = formatter.parse(value ?? "0");
                if (height <= 0 || height > 3) {
                  return "Digite uma altura válida";
                }
              }
            ]),
            keyboardType: TextInputType.number,
            inputFormatters: [
              CurrencyTextInputFormatter(
                  decimalDigits: 2,
                  symbol: "",
                  locale: "pt_BR",
                  turnOffGrouping: true)
            ],
            decoration: const InputDecoration(label: Text("Altura:")),
          )
        ]),
      ),
      actions: [
        ElevatedButton(
            onPressed: () async {
              final formValid = _formKey.currentState?.validate() ?? false;
              if (formValid) {
                final name = _nameEC.text;
                final height = formatter.parse(_heightEC.text) as double;
                final user = UserModel(name: name, altura: height, imcs: {});
                context.read<AppController>().saveNewUser(user);
                if (context.read<AppController>().users.isEmpty) {
                  Loader.show(context);
                  await Future.delayed(const Duration(seconds: 1));
                  Loader.hide();
                }
                context.read<AppController>().changePage(1);
                Navigator.of(context).pop();
              }
            },
            child: Text("Salvar"))
      ],
    );
  }
}
