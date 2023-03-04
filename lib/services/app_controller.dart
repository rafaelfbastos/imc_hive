import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:imc/models/user_model.dart';

class AppController extends ChangeNotifier {
  late Box box;

  openBox() async {
    box = await Hive.openBox<UserModel>("user");
  }

  void salvar(UserModel user) {
    box.add(user);
  }

  limpar() {
    box.clear();
  }

  List<UserModel> todos() {
    var lista = box.values;

    return lista.map<UserModel>((e) => e).toList();
  }
}
