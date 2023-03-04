// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  double altura;
  @HiveField(2)
  List<double> imcs;

  UserModel({
    required this.name,
    required this.altura,
    required this.imcs,
  });

  factory UserModel.def() {
    return UserModel(name: "Usuário", altura: 0, imcs: []);
  }
}
