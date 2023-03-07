import 'package:hive/hive.dart';
import 'package:imc/models/user_model.dart';

class UserRepository {
  Box? _box;
  Box? _boxLast;

  static UserRepository? _instance;

  UserRepository._();

  factory UserRepository() {
    _instance ??= UserRepository._();
    return _instance!;
  }

  Future<void> openBox() async {
    _box = await Hive.openBox<UserModel>("user");
    _boxLast = await Hive.openBox("last");
  }

  Future<Box> get box async {
    if (_box == null) {
      await openBox();
      return _box!;
    }
    return _box!;
  }

  Future<Box> get boxLast async {
    if (_boxLast == null) {
      await openBox();
      return _boxLast!;
    }
    return _boxLast!;
  }
}
