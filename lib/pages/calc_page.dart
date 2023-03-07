import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imc/controller/app_controller.dart';
import 'package:imc/widgets/custom_radial_gauge.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

class CalcPage extends StatelessWidget {
  final AppController _controller;

  const CalcPage({Key? key, required AppController controller})
      : _controller = controller,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final weightEC = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: const Color(0xfff9f9fe),
      appBar: AppBar(
        title: Text(
          "Calcular IMC",
          style: GoogleFonts.montserratAlternates(
              fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                "Bem vindo ${context.watch<AppController>().lastUser?.name}",
                style: GoogleFonts.montserratAlternates(
                    fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomRadialGauge(
                imc: context.select<AppController, double>(
                    (controller) => controller.imc),
              ),
              const SizedBox(height: 10),
              Visibility(
                visible: context.watch<AppController>().imc != 0,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 60),
                    child: Text(
                      "IMC: ${context.watch<AppController>().imc.toStringAsFixed(2)}",
                      style: GoogleFonts.montserratAlternates(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  controller: weightEC,
                  validator: Validatorless.required("Digite seu peso"),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    CurrencyTextInputFormatter(
                        locale: "pt_BR",
                        decimalDigits: 2,
                        symbol: "",
                        turnOffGrouping: true)
                  ],
                  decoration: InputDecoration(
                      label: Text(
                    "Peso:",
                    style: GoogleFonts.montserratAlternates(fontSize: 18),
                  )),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    final formValid = formKey.currentState?.validate() ?? false;
                    final formatter = NumberFormat.compactCurrency(
                        locale: "pt_BR", decimalDigits: 2);
                    if (formValid) {
                      var weight = formatter.parse(weightEC.text) as double;
                      context.read<AppController>().imcCalc(weight);
                    }
                  },
                  child: Text(
                    "Calcular",
                    style: GoogleFonts.montserratAlternates(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ))
            ],
          ),
        ),
      )),
    );
  }
}
