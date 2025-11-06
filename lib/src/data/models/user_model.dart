import 'package:xizmatbor/src/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({required super.name, required super.email});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(name: json['name'], email: json['email']);
  }
}
