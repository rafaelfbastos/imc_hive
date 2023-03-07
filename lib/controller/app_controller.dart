// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:imc/models/user_model.dart';
import 'package:imc/services/user_service.dart';

class AppController extends ChangeNotifier {
  final UserService _service;
  List<UserModel> users = [];
  UserModel? lastUser;
  int selectedPage = 1;
  int lastIndice = 0;
  double imc = 0;
  PageController pageController = PageController(initialPage: 1);

  AppController({
    required UserService service,
  }) : _service = service;

  loadUsers() async {
    final user = await _service.allUser();
    lastIndice = await _service.lastIndice();
    users = user.map((e) => e).toList();
    lastUser = await _service.user(lastIndice);
    loadLastImc();
    notifyListeners();
  }

  saveLast(int i) async {
    await _service.saveLast(i);
    lastUser = await _service.user(i);
    loadLastImc();
    notifyListeners();
  }

  changePage(int number) {
    selectedPage = number;
    pageController.jumpToPage(number);
    notifyListeners();
  }

  saveNewUser(UserModel user) async {
    await _service.save(user);
    loadUsers();
    notifyListeners();
  }

  delete() async {
    lastIndice = await _service.lastIndice();
    _service.deleteUser(lastIndice);
    loadUsers();
    notifyListeners();
  }

  imcCalc(double weight) async {
    if (imc != 0) {
      imc = 0;
      notifyListeners();
    }
    await Future.delayed(const Duration(seconds: 1));
    imc = weight / (lastUser!.altura * lastUser!.altura);

    final date = DateTime.now();
    final register = {"${date.day}/${date.month}/${date.year}": imc};
    lastUser!.imcs.addAll(register);
    await lastUser?.save();
    notifyListeners();
  }

  loadLastImc() {
    var imcs = lastUser?.imcs ?? {};
    if (imcs.isNotEmpty) {
      imc = imcs.values.last;
    } else {
      imc = 0;
    }
    notifyListeners();
  }
}
