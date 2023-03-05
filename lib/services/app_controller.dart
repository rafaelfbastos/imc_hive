// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:imc/models/user_model.dart';
import 'package:imc/repositories/user_repository.dart';

class AppController extends ChangeNotifier {
  final UserRepository _repository;
  List<UserModel> users = [];

  AppController({
    required UserRepository repository,
  }) : _repository = repository;
}
