// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../models/user_model.dart';
import '../repositories/user_repository.dart';

class UserService {
  final UserRepository _repository;
  UserService({
    required UserRepository repository,
  }) : _repository = repository;

  Future<List<UserModel>> allUser() async {
    var box = await _repository.box;
    var users = box.values;

    return users.map<UserModel>((e) => e).toList();
  }

  Future<UserModel> user(int i) async {
    var box = await _repository.box;
    return (box.isEmpty) ? UserModel.def() : box.getAt(i);
  }

  Future<void> saveLast(int i) async {
    var box = await _repository.boxLast;
    box.put("last", i);
  }

  Future<void> save(UserModel user) async {
    var box = await _repository.box;
    box.add(user);
    saveLast(box.length - 1);
  }

  Future<int> lastIndice() async {
    var box = await _repository.boxLast;
    return box.get("last") ?? 0;
  }

  Future<void> deleteUser(int i) async {
    var box = await _repository.box;
    box.deleteAt(i);
    saveLast(0);
  }
}
