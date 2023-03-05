import 'package:hive/hive.dart';
import 'package:imc/models/user_model.dart';

class UserRepository {
  Box? _box;
  static UserRepository? _instance;

  UserRepository._();

  factory UserRepository() {
    _instance ??= UserRepository._();
    return _instance!;
  }

  Future<void> openBox() async {
    _box = await Hive.openBox<UserModel>("user");
  }

  Future<Box> get box async {
    if (_box == null) {
      await openBox();
      return _box!;
    }
    return _box!;
  }
}
